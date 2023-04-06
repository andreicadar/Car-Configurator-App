# Car-Configurator-App

Car configurator app done for the final project for the OOP course at university. The project was done in less than a week.

## About

The purpose of the project was to display what we have learned during the semester in the OOP course.

### Technologies

<ul>
    <li>Back-End: Spring-Boot:leaves:</li>
    <li>Front-End: Javascript, HTML and CSS:paintbrush:</li>
    <li>DBMS: MySQL:books:</li>
    <li>Webserver: Apache:globe_with_meridians:</li>
</ul>

### Usage

The user when entering on [**index**](Front%20end/index.html) can register a new account or log in if he already has one.
![IndexPage](Media/Index.png)

Simple Log In page with white/dark theme [**login**](Front%20end/login.html)
![LoginPage](Media/DarkLogin.png)

![LoginPage](Media/LightLogin.png)

Simple Register page with white/dark theme and common fields [**register**](Front%20end/register.html)
![RegisterPage](Media/RegisterDark.png)

After successfully loging in the user arrives on his home page [**home**](Front%20end/configureCar.html)
![CarPage](Media/BlueCar.png)
<br>
Here the user has 4 drop-down menus. He can choose an engine, a set of rims and a paint for the car. After he chooses something the disaplyed car below will be updated acordingly. Also a small description table will appear on the left with details about the selected option.
![CarPage](Media/ListConfigured.png)
<br>
If he chooses an already configured car stored on his account all the options will be imported.
<br>
The price is also displayed on the top right of the screen

## Back-End

It has a simple `Controller -> Service -> DataAccess` layered structure.
<br>
Every API call except **/login** requires a JWT authentication token

## Front-End

Since there were only 4 pages in total it was not worth to use a framework like React or Angular so I have chosen plain simple HTML, JS and CSS.
<br>
I may not be Picasso, but I have tried to make the design as good as I can. The **Switch theme** button gives a nice touch to the design, nowadays almost evey page has a dark-theme button.
<br>
The [**login**](Front%20end/login.html) and [**register**](Front%20end/register.html) page have an box to display a log message with <span style="color:green">green</span> background for successful requests and <span style="color:red">red</span> for unsuccessful requests.
