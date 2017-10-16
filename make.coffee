@InstantiateCoffee = {}

class InstantiateCoffee.Functions
    angle = 0
    running = false
    apiKey = "AIzaSyBFS0zhlxlILYISoSWv6vZz_Ei5xTerVcY"
    @setMap = (type) ->
        map = document.getElementById('map')
        if type == "place"
            map.src = "https://www.google.com/maps/embed/v1/place?q=coffee%20near%20me&key=#{apiKey}"
        else if type == "search"
            map.src = "https://www.google.com/maps/embed/v1/search?q=coffee+near+me&key=#{apiKey}"

    @rotate = (angle) ->
        running = true
        setTimeout(( ->
            coffees = document.getElementsByClassName('Coffee')
            if coffees.length > 0
                for i in [0..coffees.length - 1]
                    coffees[i].style.transform = "rotate(#{angle}deg)"
            angle += 15
            if angle <= 360
                InstantiateCoffee.Functions.rotate(angle)
            else
                angle = 0
                running = false
        ), 30)
        
    @buttonClick = ->
        node = document.createElement("img")
        node.setAttribute("class", "Coffee")
        node.setAttribute("src", "coffee.png")
        node.setAttribute("alt", "It's Coffee!")
        node.setAttribute("width", "Coffee")
        node.setAttribute("height", "Coffee")
        document.getElementById("CoffeeHolder").appendChild(node)
        if not running
            InstantiateCoffee.Functions.rotate(0)
