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
  
      $('.container .row .col-12 .listing-link .listing-item-wrapper .listing-item')
        .map((index, element) => {
          const rank = $(element).find('.rank').text();
          const name = $(element).find('.f1-color--black').text();
          const firstname1=$(element).find('.first-name').eq(0).text();
          const firstname2=$(element).find('.first-name').eq(1).text();
          const lastname1=$(element).find('.last-name').eq(0).text();
          const lastname2=$(element).find('.last-name').eq(1).text();
          if (rank) teams.push({
            name: name, 
            rank: rank, 
            driver1:  `${firstname1} ${lastname1}`,
            driver2:  `${firstname2} ${lastname2}`
          });
        })
        .get();

      writeResults('team.json', teams)  


    } catch (error) {
      console.error('Error crawling formula1.com:', error);
    }
}

crawlMain();