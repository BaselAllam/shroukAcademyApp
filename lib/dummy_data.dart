

List<String> headerImgs = [
  'https://www.sha.edu.eg/upload/slider/671152593_slider23.jpg',
  'https://www.sha.edu.eg/upload/slider/341614365_slider232.jpg',
  'https://www.sha.edu.eg/upload/slider/257497350_slider234.jpg',
  'https://www.sha.edu.eg/upload/slider/350427671_slider2023_2.jpg',
  'https://www.sha.edu.eg/upload/slider/915336249_slider233.jpg'
];

List<Map<String, String>> facultyData = [
  {
    'title': 'Computer Science',
    'img': 'https://hicit.sha.edu.eg/assets/img/logo.png'
  },
  {
    'title': 'IHMI',
    'img': 'https://ihmi.sha.edu.eg/layout/images/ihmi_logoweb.png'
  },
  {
    'title': 'Engineering',
    'img': 'https://hie.sha.edu.eg/images/WEBLOGOar.png'
  },
  {
    'title': 'Managment',
    'img': 'https://www.sha.edu.eg/layout/images/survey_1122.png'
  },
];


List<Map<String, String>> aboutData = [
  {
    'img': 'https://www.sha.edu.eg/layout/images/new%20Student%20Guide1-5.png',
    'title': 'Speech of the Chairman of the Board of Directors',
    'subtitle': '''My children and dear students
The mission of the Higher Institute of Engineering in Shorouk has been and will continue to be to pay attention to the educational process and develop it in line with the fourth digital revolution and to develop curricula in line with this goal.
For this reason, the interest was in graduating distinguished, righteous engineers who did not practice their engineering and practical tasks, armed with the knowledge and experience they obtained. The Institute occupied its large scientific library at the top of the Egyptian engineering institutes thanks to the efforts of its integrated administrative system, which includes faculty members and their assistants in addition to all the administrative elements based on Implementing academic plans so that the institute maintains its position and leadership as the first Egyptian institute to obtain accreditation from the National Authority for Quality Assurance and Accreditation.'''
  },
  {
    'img': 'https://www.sha.edu.eg/layout/images/0006652.jpg',
    'title': 'Speech by Mr. Prof. / Vice President of the Academy',
    'subtitle': '''My children and dear students
It is with my pleasure and deep appreciation that I would like to address you and congratulate you on joining the Higher Institute of Engineering at Shorouk Academy, this scientific edifice characterized by tradition and experience, which has become clear through the educational and research services that are provided and the organization of international conferences, to reflect the new visions for dealing with... With the issues of improving the quality of the educational process, the great interest in youth and nurturing creative people is due in line with the requirements of the local and regional labor market and development trends in our beloved homeland, as you represent the pillar of the nation, the builders of its renaissance, and the factors for its progress and prosperity.
My dear students, our ambition to support, qualify, and care for you is great and has no limits. We bear upon ourselves the necessity of meeting your desires in accordance with the needs of society and the requirements of sustainable development, improving the quality of life, achieving well-being for all, and preserving natural resources and sustaining them for future generations. Therefore, rules have been set for the quality of the educational process with emphasis. On the modern study plans and programs that keep pace with scientific developments and developments, which resulted in the Higher Institute of Engineering obtaining accreditation from the National Authority for Quality Assurance and Accreditation of Education as the first private institute at the level of private higher institutes and the first engineering institute at the level of private universities. I wish all of you, children, good luck and success, and be on the best of luck. I have complete confidence that Al-Shorouk Academy will bear all its responsibilities towards you, and you must do your best to acquire knowledge and be keen on learning...'''
  },
];


List<Map<String, String>> departmentData = [
  {
    'img': 'https://hie.sha.edu.eg/images/logos/physics.jpg',
    'txt': 'Department of Mathematics and Engineering Physics'
  },
  {
    'img': 'https://hie.sha.edu.eg/images/logos/physics.jpg',
    'txt': 'Department of Mathematics and Engineering Physics'
  },
  {
    'img': 'https://hie.sha.edu.eg/images/logos/physics.jpg',
    'txt': 'Department of Mathematics and Engineering Physics'
  },
  {
    'img': 'https://hie.sha.edu.eg/images/logos/physics.jpg',
    'txt': 'Department of Mathematics and Engineering Physics'
  },
  {
    'img': 'https://hie.sha.edu.eg/images/logos/physics.jpg',
    'txt': 'Department of Mathematics and Engineering Physics'
  },
  {
    'img': 'https://hie.sha.edu.eg/images/logos/physics.jpg',
    'txt': 'Department of Mathematics and Engineering Physics'
  },
  {
    'img': 'https://hie.sha.edu.eg/images/logos/physics.jpg',
    'txt': 'Department of Mathematics and Engineering Physics'
  },
];


/*


  Informational Data
    => Personal Info
    => Companoeis Info
    => Gov Info


  Operational Data ( Any Event 'Actions' Made on the System )


  Data => Storage
            => Low ( Tv, Home Appliance, Self Driving Car ) 
            => Medium ( Perosnal PCs, Personal Laptops, Personal Mpbile Phone, Smart Watch )
            => Big ( Servers, Cloud Computing )


  Data => Process
            => Dev ( CLI )
            => EndUsers ( GUI )
                => Admins
                => Staff
                => User

       >>> * Send Data * >>>
  Server => Web Service => Network => Database => Back-end Tech => Front-end => UI & UX
       <<< * Recieve Data * <<<

       Servers => Windows & Linux
       Web Services => Ngnix & Apache 
       Network 
       Databases => 1- SQL " Relationble Database " ( DBMS ) Database Management Systems
                      - MySQL
                      - OracleSQL
                      - PostgreSQL
                      - SQLlite
                 => 2- NoSQL " Documented " {} Collections ( List of Maps ) Documents 
                      - MongoDB
                      - Firebase
       Back-end Tech => Programming Language + Framework
                      - Python ( Django )
                      - PHP ( Laravel )
                      - Ruby ( Ruby on Rails )
                      - Java ( Spring )
                      - JS ( Node )
                      - C# ( .Net & AspCore )


        API => Application Programe Interface 
          => Each APIs => Collection of EndPoints
            => Each EndPoints is responsible about excuting func, this fun hosted on server
              - Func hosted server developed by Back-end Developer
              - Server ( IpAdress ) ' Domain Name '
              - SUBURL/SubURL/excute
              URL => noon.com/eg/products/iphone
          => WebPage ( Protocol HTTP )
          
          => Request => 
              - HTTP
              - URL ( domain, fullPath )
              - Method ( Post, Get, Put, Delete )
              - Body ( Data ) | ( JSON , XML )

          => Response => 
              - HTTP
              - Status Code
              - Body

          API Documentation

          Send => Object to JSON ( encode )
          Get => JSON to Object ( decode )


*/


/*

  - What's State Management
    - UI = data * deisgn

    event => process => state => redsign screen

    callMethod => cubit => states => emit

    ScopedModel & Provider => notifyListener()


  - Differnece Between Approaches 
    - Low Level State
    - Approaches 

  - BLoC

    => Business Logic Component ( Model View Controller )

    >>> Core Concpet:
    => 1- Cubit => the class that acts as controller that contains all logic related to this APP ( Module )
    => 2- Bussiness => the model that responsible to save all data
    => 3- States => state for each change that occur inside the cubit methods

    >>> Built in Widget: 
    => 1- Cubit => the class that the Controller inherit from to act as a Cubit
    => 2- BlocProvider => the widget that will be on the top of app widget tree, that uses to initiate a new object of the cubit once the app started,
                            and the cubit must only has a one object in memory
    => 3- BlocBuilder | BlocListener => the parent widget for each listener widget
    => 4- States => just an abstract class that acts as a parent for all process states

*/


/*

  1- Analysis
  2- Design Pattern
    a- Models
    b- Cubits
    c- CRUD Operations
    d- States
  3- Implement Design With State Management
  4- Testing
  5- Release


*/