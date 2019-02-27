# TheCodingGame

Goal

To create a web-based game for training developers (while having fun!)
Methodology
1. You will fork this GitHub repo and use your forked repo for your code, as soon as you reach each milestone (see below) you will do a Pull Request from your repo into our S2group repo.
2. You will develop a prototype of the game
3. We will ask real Android developers to play with it
4. You will refine the prototype according to the feedback of the players
5. We will advertise your game via the GitHub repo
Requirements
* R1: The game will have the following main components:
   * WebClient: Single-page application based on HTML5, CSS3, and JavaScript
   * Database: A MongoDB database for storing the levels of the game and its users, and all the data related to each gaming session (the database will keep track of each single gaming session like timestamps, users, answers, scores)
   * RestAPI: A REST API for letting the  MongoDB database communicate with the WebClient
* R2: The User interface of the game should be well-organized, clean, and not confusing at all.
   * Suggestion, use this CSS framework: https://semantic-ui.com/
   * At each step, the game shows a diff representation between two files (similarly to how GitHub does - see here for an example) and a set of questions about the difference between those two files.
   * After answering to all questions, the game goes to the next diff, and so on, until the end of the level.
   * This goes on according to the definitions of the levels (see the JSON configuration file below).
* R3: 
   * The definition of the levels and their sequence of diffs is defined once for all in a configuration file encoded in JSON (see the structure of the JSON file below)
   * A dedicated Python script parses the JSON file of the levels (together with all the referenced before/after files) and populates the Database
   * All strings defined in the JSON file and appearing into the user interface should be treated as HTML code (this gives freedom in terms of customization).
* R4: A user can access directly a gaming level via a unique dedicated link 
* R5: Simple login system where users can register and login into the game (in addition to the set of default users)


Structure of the JSON file
See here: https://jsonformatter.org/json-editor/1a4de4
Milestones
* Fork of GitHub repository - deadline: now :) 
* Design and Development
   * WebClient developed (with fake data and mocked back-end) [R2] - deadline: March 8
   * Backend developed and linked to WebClient [R1] - deadline: March 31
   * Management for the JSON configuration file [R3] - deadline: April 8
   * Direct access to levels via unique links [R4] - deadline April 13
   * User management [R5] - deadline Apr 25
* Management of our final feedback - deadline Apr 30
* User study with real players and data collection - deadline May 10
* Management of players’ feedback - deadline May 20
* Thesis writing: June 15
* Thesis presentation: June 30
Useful links
* MongoDB documentation: https://docs.mongodb.com/
* MongoDB REST API library: https://docs.mongodb.com/ecosystem/tools/http-interfaces/
* JavaScript library for showing diff files: https://github.com/rtfpessoa/diff2html
* JavaScript library for creating diff files: https://github.com/kpdecker/jsdiff
