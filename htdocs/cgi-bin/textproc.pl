#!/usr/bin/env perl
use strict;
use warnings;

print "Content-type: text/html\n\n";

# Get input text from query parameter
my $query_string = $ENV{'QUERY_STRING'} || '';
my $input_text = '';
my $operation = 'upper';

# Simple query string parsing
if ($query_string) {
    my @pairs = split(/&/, $query_string);
    foreach my $pair (@pairs) {
        my ($name, $value) = split(/=/, $pair);
        $value =~ tr/+/ /;
        $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
        if ($name eq 'text') {
            $input_text = $value;
        } elsif ($name eq 'op') {
            $operation = $value;
        }
    }
}

# Default text if none provided
if (!$input_text) {
    $input_text = "Hello World! This is a Perl text processor.";
}

# Simple text transformations
my $result = $input_text;
if ($operation eq 'upper') {
    $result = uc($input_text);
} elsif ($operation eq 'lower') {
    $result = lc($input_text);
} elsif ($operation eq 'reverse') {
    $result = reverse($input_text);
}

# Output HTML
print <<EOF;
<!DOCTYPE html>
<html>
<head>
    <title>Perl Text Processor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #9b59b6, #8e44ad);
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
        .text-box {
            background: rgba(0,0,0,0.3);
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            font-family: monospace;
        }
        form {
            background: rgba(255,255,255,0.1);
            padding: 20px;
            border-radius: 10px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background: #27ae60;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }
        button:hover {
            background: #229954;
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
        <h1>Perl Text Processor</h1>
        
        <div class="text-box">
            <h3>Original Text:</h3>
            <p>$input_text</p>
        </div>
        
        <div class="text-box">
            <h3>Processed Text ($operation):</h3>
            <p>$result</p>
        </div>
        
        <form method="GET">
            <textarea name="text" rows="4" placeholder="Enter your text here...">$input_text</textarea>
            <br><br>
            <button type="submit" name="op" value="upper">UPPERCASE</button>
            <button type="submit" name="op" value="lower">lowercase</button>
            <button type="submit" name="op" value="reverse">Reverse</button>
        </form>
        
        <div class="back-link">
            <a href="/">Back to Home</a>
        </div>
    </div>
</body>
</html>
EOF
