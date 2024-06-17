
# HOT NEWS APP 

Hot News App, is a mobile application developed with ``Swift Language`` using programmatical layout approach. Main purpose of the development process is educational, thus all critisms will be greeted with joy. Please contact with [creator](mailto:dev.ilkerciblak@gmail.com), or open an issue to contribute.

> [!Note]
> Project is WIP 🚧

## Scope and Insperations
Main scope of the application is to gather top read headlines from all around the world, or some filtered results based on the user preferences. On the business logic part, the project inspired by  the real-world app [BUNDLE NEWS APP](https://www.bundle.app/). For the user-interface, [NEWS-APP](https://dribbble.com/shots/9151908-News-App?utm_source=Clipboard_Shot&utm_campaign=albertomacherelli&utm_content=News%20App&utm_medium=Social_Share&utm_source=Clipboard_Shot&utm_campaign=albertomacherelli&utm_content=News%20App&utm_medium=Social_Share) design published on Alberto Macherelli's page was inspired.

## Packages and APIs
* [NEWS API](https://newsapi.org) - is a simple HTTP REST API for searching and retrieving live articles from all over the web.
* [SDWEBIMAGE](https://github.com/SDWebImage/SDWebImage) - Asynchronous image downloader package with cache support for swift projects
* [Font: Bebas Neue](https://fonts.google.com/specimen/Bebas+Neue) - Preferred font for top rated news (home page) hero cards

## Network Layer and API Architecture
In order to construct re-usable, robust and loosely coupled network layers and api layers, conducted some re-search on design architectures. 
    
Based on this architecture, a `Networkable` protocol is defined to use it as an Interface for my network layer or layer(s) in future - there can be a mock service-. Based on this interface, a `Generic` network manager was built. By means of generic, in result any network method will return desired `Codable\Decodable` modal or an Error Inheritance. Than, on API Layers, a property type annotated `Networkable` is plugged with this network layer. In future there can be many or any mock network manager can be plug to any API layer.

* Dependency Inversion: [Dependency Inversion](https://gokhana.medium.com/dependency-inversion-prensibi-nedir-kod-%C3%B6rne%C4%9Fiyle-soli%CC%87d-b61296523565)
* Generic Network Layer : [Generic Network Layer](https://sabapathy7.medium.com/how-to-create-a-network-layer-for-your-ios-app-623f99161677)

## Exception Handling
🚧


## Securing API KEYS - HEADERS


## Future Works
[X] Improve Generic Network Manager, following Dependency Inversion princible

[x] Create `Header Detail` Screen

[x] Create WebView Service

[ ] Generate Exception Handling 

[ ] Secure Api-Keys and other secrets
