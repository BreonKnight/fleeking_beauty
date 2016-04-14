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
//= require bootstrap.min
//= require d3
//= require_tree .
$(document).ready(function() {

  console.log("sanity check");

  var $votesGraphs = $('.vote');  // assigns array of elements with class 'vote'

  // renders bar graph for each element in $votesGraphs array
  $votesGraphs.each(function() {
    var $id = $(this).attr("id"); // gets id of element
    var $vote_percentage = $('#' + $id).data("vote-percentage");  // gets 'vote-percentage' by id of element

    // renders graph if condition met
    if ($vote_percentage > 0) {
      draw($vote_percentage, $id);  // draw function renders graph to view
    }

  });

  // draw function defines svg bar graph + renders to view
  // percentage used for constructing graph
  // id used for placing graph within correct div
  function draw(percentage, id) {

    // assigns the graph id of svg element
    var graph = '#graph' + id;

    // defines overall width and height of svg element
    var barWidth = 320,
      barHeight = 50;

    // defines percentage relative to barWidth
    var relativeWidth = ((percentage * barWidth) / 100)

    // sets attributes of svg #graph element
    var chart = d3.select(graph)
      .attr("width", barWidth)  // sets width
      .attr("height", barHeight); // sets height

    // sets svg #graph g transformation
    var bar = chart.selectAll('g')
      .data([relativeWidth])  // sets g data
      .enter().append("g")  // appends g element to svg
      .attr("transform", function(ele, ind) {
        return "translate(0," + ind * barHeight + ")";  // sets g transformation
      });

    // appends background rect to svg #graph
    bar.append("rect")
      .attr("width", barWidth)  // sets width
      .attr("height", barHeight)  // sets height
      .style("fill", "#B3B3FF");  // sets styled fill

    // appends relativeWidth rect to svg #graph
    bar.append("rect")
      .attr("width", relativeWidth) // sets width
      .attr("height", barHeight)  // sets height
      .style("fill", "#ff0080");  // sets styled fill

    // appends text to svg #graph
    bar.append("text")
      .attr("class", "graph-text")  // sets unique "graph-text" class
      .attr("x", barWidth - 150)  // sets x position of left side of text
      .attr("y", barHeight / 2) // sets y position of bottom of text
      .attr("dy", ".35em")  // sets offset y position
      .style("fill", "white") // sets text color
      .style("font-weight", "bold") // sets text style
      .text(percentage + " % HOT"); // sets text

  }

  function error() {
    console.log("error");
  }

});
