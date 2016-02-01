// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require d3
//= require_tree .

$.ajax({
  type: "GET",
  contentType: "application/json; charset=utf-8",
  url: '/places/show',
  dataType: 'json',
  success: function (data) {
    draw(data);

  },
  error: function (result) {
    error();
  }
});

 
//drawing logic
function draw(data) {
  var color = d3.scale.category20b();
  var width = 1000,
    barHeight = 100;

  var x = d3.scale.linear()
    .range([0, width])
    .domain([0, d3.max(data)]);

  var chart = d3.select("#graph")
    .attr("width", width)
    .attr("height", barHeight * data.length);

  var bar = chart.selectAll("g")
    .data(data)
    .enter().append("g")
    .attr("transform", function (d, i) {
      return "translate(0," + i * barHeight + ")";
    });

  bar.append("rect")
    .attr("width", x)
    .attr("height", barHeight - 1)
    .style("fill", function (d) {
      return color(d);
    });

  bar.append("text")
    .attr("x", function (d) {
      return x(d) - 10;
    })
    .attr("y", barHeight / 2)
    .attr("dy", ".35em")
    .style("fill", "white")
    .text(function (d) {
      return d;
    });
}
 
function error() {
  console.log("error");
}