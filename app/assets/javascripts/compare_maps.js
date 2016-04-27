$('#comparison').ready(function() {

  $('.carrier-map').click(function(event){
    event.preventDefault();
    $.ajax({
      type: "GET",
      contentType: "application/json; charset=utf-8",
      url: 'carriers/data',
      data: {'id': $(this).data('params-id')},
      dataType: 'json',
      success: function (data) {
        $.getJSON('carriers/usData', function(usData){
          draw(usData, data);
        })
      },
        error: function (result) {
        error();
      }
    });
  })

    function draw(us, data){
      $('.states').remove();
      $('svg').remove();
      var width = 960;
      var height = 500;

      var radius = d3.scale.sqrt()
          .domain([0, 1e6])
          .range([0, 8]);

      var path = d3.geo.path();

      var svg = d3.select("#metro-compare").append("svg")
          .attr("width", width)
          .attr("height", height);

      ready(us, data);

      function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }

      function ready(us, mapData) {
        // if (error) throw error;

        var tip = d3.tip()
          .attr('class', 'd3-tip')
          .offset([-10, 0])
          .html(function(d) {
            return d.properties.name +": " + numberWithCommas(d.properties.population);
          })

         debugger;

        svg.append("path")
            .attr("class", "states")
            .datum(topojson.feature(us, us.objects.states))
            .attr("d", path)

        svg.selectAll(".symbol")
            .data(mapData.features.sort(function(a, b) { return b.properties.population - a.properties.population; }))
            .enter().append("path")
            .attr("class", "symbol")
            .attr("d", path.pointRadius(function(d) { return radius(d.properties.population); }))
            .on('mouseover', tip.show)
            .on('mouseout', tip.hide);

        svg.call(tip);

      }
    }


  // $.getJSON('carriers/usData', function(data){
  //   drawMap(data);
  // })

  // $('.carrier-map').click(function(event){
  //   event.preventDefault();
  //   $.ajax({
  //     type: "GET",
  //     contentType: "application/json; charset=utf-8",
  //     url: 'carriers/data',
  //     data: {'id': $(this).data('params-id')},
  //     dataType: 'json',
  //     success: function (carrierData) {
  //       drawCities(carrierData);
  //     },
  //       error: function (result) {
  //       error();
  //     }
  //   });
  // })

  // function numberWithCommas(x) {
  //   return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  // }

  // function drawMap(data){

  //   var width = 960;
  //   var height = 510;

  //   var radius = d3.scale.sqrt()
  //       .domain([0, 1e6])
  //       .range([0, 8]);

  //   var path = d3.geo.path();

  //   var svg = d3.select("#metro-compare").append("svg")
  //       .attr("width", width)
  //       .attr("height", height);

  //   ready(data);

  //   function numberWithCommas(x) {
  //     return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  //   }

  //   function ready(data) {


  //     svg.append("path")
  //         .attr("class", "states")
  //         .datum(topojson.feature(data, data.objects.states))
  //         .attr("d", path)

  //   }
  // }

  // function drawCities(cityData) {

  //   debugger;

  //   var width = 960;
  //   var height = 510;

  //   var radius = d3.scale.sqrt()
  //       .domain([0, 1e6])
  //       .range([0, 8]);

  //   var path = d3.geo.path();

  //   var svg = d3.select("#metro-compare").append("svg")
  //       .attr("width", width)
  //       .attr("height", height);

  //   ready(cityData);


  //   function ready(cityData) {


  //     var tip = d3.tip()
  //       .attr('class', 'd3-tip')
  //       .offset([-10, 0])
  //       .html(function(d) {
  //         return d.properties.name +": " + numberWithCommas(d.properties.population);
  //       })

  //     svg.selectAll(".symbol")
  //       .data(cityData.features.sort(function(a, b) { return b.properties.population - a.properties.population; }))
  //       .enter().append("path")
  //       .attr("class", "symbol")
  //       .attr("d", path.pointRadius(function(d) { return radius(d.properties.population); }))
  //       .on('mouseover', tip.show)
  //       .on('mouseout', tip.hide);

  //     svg.call(tip);
  //   }

  // }
});

