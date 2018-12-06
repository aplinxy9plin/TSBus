var http = require("http");

var options = {
  "method": "GET",
  "hostname": "localhost",
  "port": null,
  "path": "/data.html?start=%D0%A2%D0%BE%D0%BC%D1%81%D0%BA%2C%20%D0%A1%D0%BE%D0%B2%D0%B5%D1%82%D1%81%D0%BA%D0%B0%D1%8F%2086&end=%D0%A2%D0%BE%D0%BC%D1%81%D0%BA%2C%20%D0%BC%D0%B8%D1%80%D0%B0%2048",
  "headers": {
    "content-length": "0"
  }
};

var req = http.request(options, function (res) {
  var chunks = [];

  res.on("data", function (chunk) {
    chunks.push(chunk);
  });

  res.on("end", function () {
    var body = Buffer.concat(chunks);
    console.log(body.toString());
  });
});

req.end();
