const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');


const url = 'https://www.formula1.com/en/teams.html';

const teams=[]

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
    try {
      const response = await axios.get(url);
      const $ = cheerio.load(response.data);
      let links = [];
      $('.container .row .col-12 .listing-link').map(
        (i,e) => links.push($(e).attr('href'))
      )
      // console.log(links);
      
      let temp=[];
      $('.container .row .col-12 .listing-link .listing-item-wrapper .listing-item')
        .map((index, element) => {
          const name = $(element).find('.f1-color--black').text();
          // const logo =$(element).find('picture[class="team-car"]').html();
          // console.log(logo);

          if (name) temp.push(name);
        })
        .get();

      // console.log(teams)
      for (let i=0; i<links.length; i++){
        let obj = await crawlDetails(links[i]);
        teams.push({
          ...obj, name:temp[i]
        })
      }
      writeResults('team.json', teams)  


    } catch (error) {
      console.error(`Error crawling ${url}`, error);
    }
}

async function crawlDetails(link){
    const url = 'https://www.formula1.com'
    try {
      const response = await axios.get(`${url}${link}`);
      const $ = cheerio.load(response.data);

      let fullname= $('table tbody tr td').eq(0).text();
      let team_chief= $('table tbody tr td').eq(2).text();
      let champion= $('table tbody tr td').eq(7).text();
        return { fullname: fullname, team_chief: team_chief, champion:Number(champion)?Number(champion):0}
      
    } catch (error) {
      console.error(`Error crawling ${url}${link}`, error);
    }
}

crawlMain();