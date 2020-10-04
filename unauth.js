const fs = require('fs');
const argv = require('yargs').argv;
const puppeteer = require('puppeteer');
const lighthouse = require('lighthouse');
const config = require('lighthouse/lighthouse-core/config/lr-desktop-config.js');
const reportGenerator = require('lighthouse/lighthouse-core/report/report-generator');
const url = argv.url || 'https://example.com';
var mkdirp = require('mkdirp');
const baseDir = '.';
const targetDir = baseDir + '/target/';
var reportHtmlFile = targetDir + '/result-3-9-2020-16-59-38.html';
var reportJsonFile = targetDir + '/result-3-9-2020-16-59-38.json';
var reportJsonLatestFile = targetDir + 'result.json';

(async () => {

const browser = await puppeteer.launch(    
    {
    args: ['--no-sandbox','--remote-debugging-port=8041'],
    // Optional, if you want to see the tests in action.
    headless: true,
    slowMo: 50,
    }
);

initFunction();

console.log('Starting browser script...');
const page = (await browser.pages())[0];
await page.goto(url, { waitUntil: 'networkidle0' });

console.log('Running lighthouse...');
const report = await lighthouse(url, {
    port: (new URL(browser.wsEndpoint())).port,
    output: 'json',
    logLevel: 'info',
    disableDeviceEmulation: true,
    chromeFlags: ['--disable-mobile-emulation', '--disable-storage-reset']
}, config);

const json = reportGenerator.generateReport(report.lhr, 'json');
const html = reportGenerator.generateReport(report.lhr, 'html');
console.log(`Lighthouse scores: ${report.lhr.score}`);

console.log('Writing results...');

fs.writeFileSync(reportHtmlFile, html);
fs.writeFileSync(reportJsonFile, json);
fs.writeFileSync(reportJsonLatestFile, json);

console.log('Done!');

await browser.close();
})();


function initFunction() {
    var d = new Date();
    // Create target
    fs.rmdirSync(targetDir, { recursive: true });
    mkdirp(targetDir, function(err) { 
        // path exists unless there was an error
    });
    reportHtmlFile = targetDir + 'result-' + d.getUTCDate() + '-' + d.getMonth() + '-' + d.getFullYear() + '-' + d.getHours() + '-' + d.getMinutes() + '-' + d.getSeconds() + '.html';
    reportJsonFile = targetDir + 'result-' + d.getUTCDate() + '-' + d.getMonth() + '-' + d.getFullYear() + '-' + d.getHours() + '-' + d.getMinutes() + '-' + d.getSeconds() + '.json';
}

