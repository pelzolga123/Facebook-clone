<br />
<p align="center">
  <h1 align="center">fake-social-media</h1>

  <p align="center">
    A Ruby on Rails application
    <br />
    <br />
    <a href="https://fake-social-media.herokuapp.com/">View Demo</a>
    ·
    <a href="https://github.com/pelzolga123/Facebook-clone/issues">Report Bug</a>
    ·
    <a href="https://github.com/pelzolga123/Facebook-clone/issues">Request Feature</a>
  </p>
</p>


<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
  * [Features](#Features)
* [Getting Started](#getting-started)
* [Contact](#Contact)
* [License](#license)




<!-- ABOUT THE PROJECT -->
## About The Project

fake social web is our implementation of facebook using Ruby on Rails. It is a project developed while in [microverse](http://microverse.org/) software development bootcamp. 

The technical goals of the project were to be able to emulate some of the functionalities that facebook has implemented, such as allowing the users to have friends in a symmetrical irreflexive way, accept & send friend requests, submit posts and see the posts of their friends and comment on the posts of their friends.

### Built With
* [RubyonRails](https://rubyonrails.org/)


### Features
- Sending friend requests.
- Accepting friend requests.
- Remove friends.
- Add posts.
- Add comment to posts.
- Having newsfeed page based on the friends list.
- Ability to login with facebook.
- Edit setting and profile information.


<!-- GETTING STARTED -->
## Getting Started
To get started with the app, clone the repo and then install the needed gems:
```sh
$ bundle install --without production
```

Next, migrate the database:
```sh
$ rails db:migrate
```

Finally, run the app in a local server:
```sh
$ rails server
```
## Contact
* [Olga Pelts](https://github.com/pelzolga123) & [Tunde Oretade](https://github.com/tundeiness)


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

