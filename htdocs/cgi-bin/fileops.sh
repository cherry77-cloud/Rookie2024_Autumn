#!/bin/bash
echo 'Content-type: text/html'
echo ''
echo '<!DOCTYPE html>'
echo '<html>'
echo '<head>'
echo '<title>Bash File Operations</title>'
echo '<style>'
echo 'body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #34495e, #2c3e50); color: white; margin: 0; padding: 40px; }'
echo '.container { max-width: 600px; margin: 0 auto; background: rgba(255,255,255,0.1); padding: 30px; border-radius: 15px; }'
echo 'h1 { text-align: center; margin-bottom: 30px; }'
echo '.info-box { background: rgba(0,0,0,0.3); padding: 20px; border-radius: 10px; margin: 20px 0; }'
echo '.command-output { background: rgba(0,0,0,0.4); padding: 15px; border-radius: 8px; font-family: monospace; white-space: pre-wrap; max-height: 200px; overflow-y: auto; border: 1px solid rgba(255,255,255,0.2); }'
echo '.info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin: 20px 0; }'
echo '.info-item { background: rgba(255,255,255,0.1); padding: 15px; border-radius: 8px; }'
echo '.back-link { text-align: center; margin-top: 30px; }'
echo '.back-link a { color: white; text-decoration: none; }'
echo '</style>'
echo '</head>'
echo '<body>'
echo '<div class="container">'
echo '<h1>Bash File Operations</h1>'

# Current directory info
echo '<div class="info-box">'
echo '<h3>Directory Information</h3>'
echo '<div class="info-grid">'
echo '<div class="info-item"><strong>Current Directory:</strong><br>'$(pwd)'</div>'
echo '<div class="info-item"><strong>Total Files:</strong><br>'$(ls -1 | wc -l)' files</div>'
echo '<div class="info-item"><strong>User:</strong><br>'$(whoami)'</div>'
echo '<div class="info-item"><strong>Hostname:</strong><br>'$(hostname)'</div>'
echo '</div>'
echo '</div>'

# Directory listing
echo '<div class="info-box">'
echo '<h3>Directory Contents</h3>'
echo '<div class="command-output">'
ls -la | head -15
echo '</div>'
echo '</div>'

# System info
echo '<div class="info-box">'
echo '<h3>System Information</h3>'
echo '<div class="command-output">'
echo "Date: $(date)"
echo "Uptime:$(uptime -p 2>/dev/null || echo ' System uptime not available')"
echo "Shell: $SHELL"
echo '</div>'
echo '</div>'

echo '<div class="back-link">'
echo '<a href="/">Back to Home</a>'
echo '</div>'
echo '</div>'
echo '</body>'
echo '</html>' 