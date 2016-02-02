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

//= require d3
//= require_tree .
$( document ).ready(function () {

  console.log("sanity check");
  // $.ajax({
  //   type: "GET",
  //   contentType: "application/json; charset=utf-8",
  //   url: '/places/show',
  //   dataType: 'json',
  //   success: function (data) {
  //     draw(data);

  //   },
  //   error: function (result) {
  //     error();
  //   }
  // });

  //save these data attribute values for future graphs
  var upvotes = ($("p").data("upvotes"));
  var downvotes = ($("p").data("downvotes"));

  //calculate drawing using ratio (upvotes : totalvotes)
  var vote_percentage = ($("p").data("vote-percentage"));
  var total_votes = [upvotes + downvotes];
  var upvote_arr = [vote_percentage];


  draw( upvote_arr, total_votes);

  //drawing logic
  function draw( percentage ) {

    //define overall width and height of bar
    var width = 320,
      barHeight = 50;

    //defines each element of percentage relative to bar width
    var relativeFill = [];

    percentage.forEach( function( ele ) {
      ele = (( ele * width ) / 100 );
      relativeFill.push( ele );
    });

    // var x determines width of bar fill
    var x = d3.scale.linear()
      .range([0, width])
      .domain([0, d3.max(relativeFill)]);

    //sets the attributes of svg #graph
    var chart = d3.select("#graph")
      //attribute width
      .attr("width", width)
      //number of bar charts, one per element in percentage array
      .attr("height", barHeight * relativeFill.length);

    //bar chart is defined
    var bar = chart.selectAll('g')
      //data equal to percentage
      .data(relativeFill)
      .enter().append("g")
      .attr("transform", function (ele, ind) {
        return "translate(0," + ind * barHeight + ")";
      });

    //define background fill
    bar.append("rect")
      //width defined by original value
      .attr("width", width)
      //define outline of overall bar
      .style("fill", "#B3B3FF")
      //define height of bar
      .attr("height", barHeight);

    //define fill with percentage
    bar.append("rect")
      //width defined by upvote value
      .attr("width", relativeFill)
      //define height of bar
      .attr("height", barHeight)
      //define color of bar
      .style("fill", "#FF3300");

    bar.append("text")
      .attr("x", width - 50 )
      .attr("y", barHeight / 2)
      .attr("dy", ".35em")
      .style("fill", "white")
      .text(percentage + "%");

  }

  function error() {
    console.log("error");
  }

});