#!/usr/bin/env node

const querystring = require('querystring');

// Parse query string
const queryString = process.env.QUERY_STRING || '';
const params = querystring.parse(queryString);
const format = params.format || 'html';

// Generate simple API data
const apiData = {
    status: 'success',
    timestamp: new Date().toISOString(),
    data: {
        message: 'Hello from Node.js JSON API',
        numbers: [1, 2, 3, 4, 5].map(n => ({
            value: n,
            squared: n * n
        })),
        server_info: {
            node_version: process.version,
            platform: process.platform,
            uptime: process.uptime()
        }
    }
};

// Output based on format
if (format === 'json') {
    console.log('Content-type: application/json\n');
    console.log(JSON.stringify(apiData, null, 2));
} else {
    // HTML output
    console.log('Content-type: text/html\n');
    console.log(`<!DOCTYPE html>
<html>
<head>
    <title>Node.js JSON API</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: white;
            margin: 0;
            padding: 40px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 15px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .json-display {
            background: rgba(0,0,0,0.5);
            padding: 20px;
            border-radius: 10px;
            font-family: 'Courier New', monospace;
            white-space: pre-wrap;
            overflow-x: auto;
            border: 1px solid rgba(255,255,255,0.2);
        }
        .api-controls {
            text-align: center;
            margin: 20px 0;
        }
        .api-controls a {
            background: #3498db;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 5px;
        }
        .api-controls a:hover {
            background: #2980b9;
        }
        .info-box {
            background: rgba(255,255,255,0.1);
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            text-align: center;
        }
        .back-link {
            text-align: center;
            margin-top: 30px;
        }
        .back-link a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Node.js JSON API</h1>
        
        <div class="api-controls">
            <a href="?format=html">HTML View</a>
            <a href="?format=json">Raw JSON</a>
        </div>
        
        <div class="json-display">${JSON.stringify(apiData, null, 2)}</div>
        
        <div class="info-box">
            <strong>Node.js Version:</strong> ${process.version} |
            <strong>Platform:</strong> ${process.platform}
        </div>
        
        <div class="back-link">
            <a href="/">Back to Home</a>
        </div>
    </div>
</body>
</html>`);
} 