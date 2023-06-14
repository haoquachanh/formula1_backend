const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');

const url = 'https://www.formula1.com/en/racing/';
const schedules=[]

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

async function crawlMain(year){
    try {
      let link=`${url}${year}.html`;
      console.log(link);
      const response = await axios.get(link);
      const $ = cheerio.load(response.data);
      $('.container .row .col-12 .event-item-wrapper .event-item .race-card')
      .map((i,element)=>{
        let startdate=$(element).find('.start-date').text();
        let enddate=$(element).find('.end-date').text();
        let month=$(element).find('.month-wrapper').text();
        let [mstart,mend]=month.split('-')
        if (!mend) mend=mstart;

        let country=$(element).find('.event-place').text();
        let pos1=$(element).find('.position-1').find('.f1-bold--xs').text();
        let pos2=$(element).find('.position-2').find('.f1-bold--xs').text();
        let pos3=$(element).find('.position-3').find('.f1-bold--xs').text();
        
        schedules.push({
          startdate: `${startdate} ${mstart}`,
          enddate: `${enddate} ${mend}`,
          place: country,
          pos1: pos1,
          pos2: pos2,
          pos3: pos3,
          year: year,
        })
      })
      

    } catch (error) {
      console.error('Error crawling formula1.com:', error);

    }
}

async function main(){
  for (let i=2017; i<=2023; i++)
  {
    await crawlMain(i);
    if (i %10 ==0) await new Promise((resolve) => setTimeout(resolve, 200));

  }
  writeResults('schedule.json', schedules)  

}
main()