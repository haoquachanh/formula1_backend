const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');


const url = 'https://www.formula1.com';
const categories = [];

const drivers=[]

function writeResults(filename, data){
  // console.log(results)
  const jsonResults = JSON.stringify(data, null, 2);
  
  // Ghi chuỗi JSON vào tệp
  fs.writeFile(filename, jsonResults, 'utf8', (err) => {
    if (err) {
      console.error('Lỗi khi ghi tệp JSON:', err);
      return;
    }
    console.log('Đã ghi kết quả vào tệp JSON.');
  });
}

async function crawlMain(){
    const url = 'https://www.formula1.com/en/drivers.html';
    try {
      const response = await axios.get(url);
      const $ = cheerio.load(response.data);
      let links=[]

      $('main div .row .col-12')
        .map((index, element) => {
          const link=$(element).find('a').attr('href');
          if (link) links.push(link);
        })
        .get();

        
      // await crawlDetailDriver(links[1]);
      for (let link of links) {
        await crawlDetailDriver(link);
      }
      writeResults('driver.json', drivers)  


    } catch (error) {
      console.error('Error crawling formula1.com:', error);
    }
}

async function crawlDetailDriver(link){
  try {
    const response = await axios.get(`${url}${link}`);
    const $ = cheerio.load(response.data);
    let infos = [];
    $('table tbody tr')
      .map((i,element) =>{
        const info = $(element).find('td').eq(0).text();
        infos.push(info);
      })
    let drivername= $('.driver-name').text().trim().replace(/\n/g, '');
    let drivernumber = $('.driver-details .driver-number span').text().trim().replace(/\n/g, '');
    let avt=$('.driver-image-crop-inner .fom-adaptiveimage .fallback').html();
    const srcPattern = /src="([^"]+)"/; // Mẫu để tìm kiếm giá trị trong src attribute
    const match = avt.match(srcPattern);
    if (match && match.length > 1) {
      avt = match[1];}

    drivers.push({
      team: infos[0], 
      country: infos[1], 
      point: Number(infos[3]), 
      champion: infos[5]=="N/A"?0:Number(infos[5]), 
      fullname: drivername, 
      number: Number(drivernumber), 
      avt: avt
    });

  } catch (error) {
    console.error(`Error crawling DetailDriver link: ${url}${link}`, error);
  }
}


crawlMain();