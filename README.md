# TinyHTTPd Multi-Language CGI Programs

This directory contains CGI programs written in 6 different programming languages, demonstrating the versatility of CGI programming and showcasing each language's unique capabilities.

## Core CGI Programs

### 1. **C++ System Monitor** (`monitor.cgi`)
- **Language**: C++ (Compiled)
- **Features**: Real-time system monitoring, performance metrics, hardware info
- **Compilation**: `g++ -o monitor.cgi monitor.cpp`

### 2. **Python Data Processor** (`dataproc.py`)
- **Language**: Python 3
- **Features**: Statistical analysis, data visualization, custom dataset processing
- **Dependencies**: Standard Python libraries

### 3. **PHP Form Handler** (`formhandler.php`)
- **Language**: PHP
- **Features**: Form validation, data sanitization, user feedback
- **Dependencies**: PHP CLI

### 4. **Perl Text Processor** (`textproc.pl`)
- **Language**: Perl
- **Features**: Text analysis, regex transformations, string manipulation
- **Dependencies**: Perl with CGI module

### 5. **Bash File Operations** (`fileops.sh`)
- **Language**: Bash Shell
- **Features**: File system browsing, system information, directory operations
- **Dependencies**: Standard Linux/Unix commands

### 6. **Node.js JSON API** (`jsonapi.js`)
- **Language**: Node.js
- **Features**: RESTful API, JSON data generation, multiple endpoints
- **Dependencies**: Node.js runtime

## Running the Server

1. Compile the server:
   ```bash
   cd build
   make
   ```

2. Start the server:
   ```bash
   ./httpd
   ```

3. Access the web interface:
   ```
   http://localhost:4000/
   ```

## Requirements

- **Linux/Unix system**
- **Development tools**: gcc, g++, make
- **Runtime dependencies**: 
  - PHP CLI (`php`)
  - Python 3 (`python3`)
  - Perl (`perl`)
  - Node.js (`node`)
  - Standard Unix utilities

## CGI Execution

All CGI programs follow the CGI specification:
- Output starts with HTTP headers (minimum: `Content-type`)
- Empty line separates headers from body
- Programs receive input via environment variables and stdin
- Query parameters available in `QUERY_STRING` environment variable

## Educational Purpose

This project demonstrates:
- Multi-language web programming
- CGI interface implementation
- HTTP/1.0 protocol handling
- Server-side dynamic content generation
- Cross-language comparison for web development 
