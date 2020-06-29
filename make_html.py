import sys

with open("charts-template.html", "r") as fp:
    html_template = fp.read()
with open("charts.html", "w") as fp:
    fp.write(html_template.replace("__CHART_DATA_GOES_HERE__", sys.stdin.read()))

