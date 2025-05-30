#!/usr/bin/env python3
import os
import sys
import urllib.parse
import random

print("Content-type: text/html\n")

# Parse query string
query_string = os.environ.get('QUERY_STRING', '')
params = urllib.parse.parse_qs(query_string)

# Generate simple data
count = int(params.get('count', ['10'])[0]) if params.get('count') else 10
count = min(count, 50)  # Limit to 50

data = [random.randint(1, 100) for _ in range(count)]
average = sum(data) / len(data)

# Output HTML
html = f"""<!DOCTYPE html>
<html>
<head>
    <title>Python Data Processor</title>
    <style>
        body {{
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            margin: 0;
            padding: 40px;
        }}
        .container {{
            max-width: 600px;
            margin: 0 auto;
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 15px;
        }}
        h1 {{
            text-align: center;
            margin-bottom: 30px;
        }}
        .data-box {{
            background: rgba(0,0,0,0.3);
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
        }}
        .stats {{
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin: 20px 0;
        }}
        .stat {{
            background: rgba(255,255,255,0.1);
            padding: 15px;
            border-radius: 8px;
            text-align: center;
        }}
        .stat-value {{
            font-size: 24px;
            font-weight: bold;
        }}
        form {{
            text-align: center;
            margin: 20px 0;
        }}
        button {{
            background: #27ae60;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }}
        button:hover {{
            background: #229954;
        }}
        .back-link {{
            text-align: center;
            margin-top: 30px;
        }}
        .back-link a {{
            color: white;
            text-decoration: none;
        }}
    </style>
</head>
<body>
    <div class="container">
        <h1>Python Data Processor</h1>
        
        <div class="data-box">
            <h3>Generated Data ({len(data)} numbers):</h3>
            <p>{', '.join(map(str, data))}</p>
        </div>
        
        <div class="stats">
            <div class="stat">
                <div>Average</div>
                <div class="stat-value">{average:.1f}</div>
            </div>
            <div class="stat">
                <div>Min</div>
                <div class="stat-value">{min(data)}</div>
            </div>
            <div class="stat">
                <div>Max</div>
                <div class="stat-value">{max(data)}</div>
            </div>
        </div>
        
        <form method="GET">
            <button type="submit" name="count" value="10">Generate 10</button>
            <button type="submit" name="count" value="20">Generate 20</button>
            <button type="submit" name="count" value="30">Generate 30</button>
        </form>
        
        <div class="back-link">
            <a href="/">Back to Home</a>
        </div>
    </div>
</body>
</html>"""

print(html) 