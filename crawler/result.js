const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');


const url = 'https://www.formula1.com';
const categories = [];

const results=[]
const resultsDriver=[]
const resultsDHL=[]
const resultsTeam=[]
const resultsRace=[]

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
  
      $('#primaryNav .nav-width .primary-links ul li')
        .map((index, element) => {
          const category = $(element).find('.nav-mainlink .link-text').text();
          const link = $(element).find('.nav-mainlink').attr('href');
          if (link && category ) categories.push({ category, link: `${url}${link}`});
        })
        .get();
  
      for (let category of categories) {
        if (category.category==="Results") await crawlResult(category);
        // if (category==="Results") await crawlResult(category);
        // if (category==="Results") await crawlResult(category);
        // if (category==="Results") await crawlResult(category);
      }

      writeResults('resultDriver.json', resultsDriver)  
      writeResults('resultTeam.json', resultsTeam)  
      writeResults('resultDHL.json', resultsDHL)  
      writeResults('resultRace.json', resultsRace)  


    } catch (error) {
      console.error('Error crawling formula1.com:', error);
    }
}

async function crawlResult(category) {
  try {
    const response = await axios.get(category.link);
    let $ = cheerio.load(response.data);
    let theyears = [];
    let thetypes = [];
    
    let links = []
    $('.ResultArchiveContainer .resultsarchive-filter-container .resultsarchive-filter-wrap ul li').map((index, element) => {
      let tempyear = $(element).find('a[data-name="year"] .clip').text();
      let temptype = $(element).find('a[data-name="apiType"] span').text();
      let link = $(element).find('a[data-name="apiType"]').attr('data-value');

      const addresses = $(element).find('a[data-name="meetingKey"] span').text();
      if (tempyear) theyears.push(tempyear);
      if (temptype) thetypes.push(temptype);
      if (link) links.push(link);

    });
    
    // await crawlFulldataResult('fastest-laps','2023')
    
    for (let i = 0; i < theyears.length; i++) {
      if (theyears[i]==='2016') break;
      for (let j = 0; j < thetypes.length; j++) {
        await crawlFulldataResult(links[j], theyears[i])
      }

      // Handle Error read ECONNRESET
      if (i %10 ==0) await new Promise((resolve) => setTimeout(resolve, 500));
    }
  } catch (error) {
    console.error(`Error crawling link ${category.link} `, error);
  }
}

async function crawlFulldataResult(type,year){
  try {
    let url = `https://www.formula1.com/en/results.html/${year}/${type}.html`;

    console.log("link: ",url);

    const response = await axios.get(url);
    let $ = cheerio.load(response.data);

    let data=[]
    if (type === 'races')
      $('table tbody tr')
        .map((i, element)=>{
            const date = $(element).find('.dark.hide-for-mobile').text();
            const timeComplete = $(element).find('.hide-for-tablet').eq(1).text();
            const car = $(element).find('.semi-bold').text();
            const country = $(element).find('.dark.bold a').text().trim().replace(/\n/g, '');
            const firstname = $(element).find('.dark.bold .hide-for-tablet').text();
            const lastname = $(element).find('.dark.bold .hide-for-mobile').text();
            if (date && car && timeComplete) {
              resultsRace.push({date: date, car: car, timeComplete: timeComplete, country: country, driver: `${firstname} ${lastname}`, year:Number(year)});
            }
        })
    if (type === 'team')
      $('table tbody tr')
        .map((i, element)=>{
            const pos = $(element).find('.dark').eq(0).text();
            const team = $(element).find('td a').text();
            const point = $(element).find('.dark.bold').eq(1).text();
            if (pos) {
              resultsTeam.push({team: team, pos: Number(pos), point:Number(point), year:Number(year)});
            }
          })
    if (type === 'drivers')
      $('table tbody tr')
        .map((i, element)=>{
          const pos = $(element).find('.dark').eq(0).text();
          const car = $(element).find('td .grey').text();
          const point = $(element).find('.dark.bold').eq(1).text();
          const firstname = $(element).find('td a .hide-for-tablet').text();
          const lastname = $(element).find('td a .hide-for-mobile').text();
          
          if (pos) {
            resultsDriver.push({driver: `${firstname} ${lastname}`, pos: Number(pos), point:Number(point), car:car, year:Number(year)});
          }
        })
    if (type === 'fastest-laps')
      $('table tbody tr')
        .map((i, element)=>{

          
          const car = $(element).find('.semi-bold').text();
          const country = $(element).find('.width30').text();
          const firstname = $(element).find('.width25 .hide-for-tablet').text();
          const lastname = $(element).find('.width25 .hide-for-mobile').text();
          const timeComplete = $(element).find('.dark.bold').eq(1).text();
          
          // console.log("  >>>  ",timeComplete);
          if (car) {
            resultsDHL.push({driver: `${firstname} ${lastname}`, timeComplete: timeComplete, country:country, car:car, year:Number(year)});
          }
        })        

  }catch(error){
    console.error(`Error crawling function crawlFulldataResult: `, error);
  }
}

crawlMain();