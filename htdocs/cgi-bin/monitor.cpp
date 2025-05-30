#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <unistd.h>

using namespace std;

int main() {
    cout << "Content-type: text/html\n\n";
    
    // Get simple system info
    char hostname[256];
    gethostname(hostname, 256);
    
    // Get uptime
    ifstream uptimeFile("/proc/uptime");
    double uptime = 0;
    if (uptimeFile.is_open()) {
        uptimeFile >> uptime;
        uptimeFile.close();
    }
    int hours = int(uptime) / 3600;
    int minutes = (int(uptime) % 3600) / 60;
    
    // Get CPU count
    int cpuCount = 0;
    ifstream cpuFile("/proc/cpuinfo");
    string line;
    while (getline(cpuFile, line)) {
        if (line.find("processor") == 0) {
            cpuCount++;
        }
    }
    cpuFile.close();
    
    cout << "<!DOCTYPE html>\n";
    cout << "<html>\n";
    cout << "<head>\n";
    cout << "<title>C++ System Monitor</title>\n";
    cout << "<style>\n";
    cout << "body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #8B5A3C, #D2B48C); ";
    cout << "color: white; margin: 0; padding: 40px; }\n";
    cout << ".container { max-width: 600px; margin: 0 auto; background: rgba(255,255,255,0.1); ";
    cout << "padding: 30px; border-radius: 15px; }\n";
    cout << "h1 { text-align: center; margin-bottom: 30px; }\n";
    cout << ".info-box { background: rgba(0,0,0,0.3); padding: 20px; border-radius: 10px; margin: 20px 0; }\n";
    cout << ".info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }\n";
    cout << ".info-item { background: rgba(255,255,255,0.1); padding: 15px; border-radius: 8px; }\n";
    cout << ".back-link { text-align: center; margin-top: 30px; }\n";
    cout << ".back-link a { color: white; text-decoration: none; }\n";
    cout << "</style>\n";
    cout << "</head>\n";
    cout << "<body>\n";
    cout << "<div class=\"container\">\n";
    cout << "<h1>C++ System Monitor</h1>\n";
    
    cout << "<div class=\"info-box\">\n";
    cout << "<h3>System Information</h3>\n";
    cout << "<div class=\"info-grid\">\n";
    cout << "<div class=\"info-item\"><strong>Hostname:</strong> " << hostname << "</div>\n";
    cout << "<div class=\"info-item\"><strong>Process ID:</strong> " << getpid() << "</div>\n";
    cout << "<div class=\"info-item\"><strong>CPU Cores:</strong> " << cpuCount << "</div>\n";
    cout << "<div class=\"info-item\"><strong>Uptime:</strong> " << hours << "h " << minutes << "m</div>\n";
    cout << "</div>\n";
    cout << "</div>\n";
    
    cout << "<div class=\"back-link\">\n";
    cout << "<a href=\"/\">Back to Home</a>\n";
    cout << "</div>\n";
    cout << "</div>\n";
    cout << "</body>\n";
    cout << "</html>\n";
    
    return 0;
}