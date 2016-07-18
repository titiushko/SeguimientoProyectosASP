# 1. INTRODUCTION
This manual is developed for people with technical knowledge of computers since the processes and elements that were used in the development of ContractStandards are described. This manual is divided into categories such as: Development Tools, ContractStandards Architecture, Standards used, Database. a specific description of the attributes contained in each of the tables in the database is also done, all this is detailed by the Data Dictionary. Which encompasses all elements both physical and logical that make up the system.

# 2. GENERAL
ContractStandards be accessed from the web architecture using a model-view-controller, the software will be mentioned, necessary hardware for operation.

# 3. DEVELOPMENT TOOLS
In this paragraph the minimum characteristics that must have software and hardware to install and use effectively ContractStandards detailed.  
1. Microsoft Visual Studio 2015.  
2. ASP.NET MVC 5.  
3. Microsoft SQL Server 2008 R2 or higher.

# 4. ARCHITECTURE Model- View-Controller (MVC)
The main advantage of this style is that development can be carried out at various levels and, if there occurs any change, only attacks the required level without having to review between mixed code.

## 4.1. LAYER MODEL
It is the representation of the information with which the system operates, thus manages all access to such information, both queries and updates, also implementing access privileges have been described in the specifications of the application. Send the 'view' that part of the information at all times is asked to be shown (typically a user). Requests for access or manipulation of information reaching the 'model' through the controller.

## 4.2. LAYER VISTA
Presents the 'model' (information and business logic) in a suitable format to interact therefore it requires that 'model' the information to be represented as output.

## 4.3. LAYER CONTROLLER
Responds to events (typically user actions) and invokes requests to the 'model' when a request for information is made (for example, edit a document or record in a database). You can also send commands to your 'view' associated if a change is required in the way it is presented as a 'model' (eg, displacement or scroll through a document or different records in a database), so you could say that the 'controller' is the intermediary between the 'view' and 'model'.

![ASP .NET MVC.svg](http://titiushko.github.io/SeguimientoProyectosASP/resources/ASP .NET MVC.svg)

# 5. DATABASE
## 5.1. SCHEME
### 5.1.1 Clauses Relations Sub-Scheme
![ContractStandards.jpg](http://titiushko.github.io/SeguimientoProyectosASP/resources/ContractStandards01.jpg)

### 5.1.2 Organizations Relations Sub-Scheme
![ContractStandards.jpg](http://titiushko.github.io/SeguimientoProyectosASP/resources/ContractStandards02.jpg)

### 5.1.3 kResolve Relations Sub-Scheme
![ContractStandards.jpg](http://titiushko.github.io/SeguimientoProyectosASP/resources/ContractStandards03.jpg)

### 5.1.2 System Relations Sub-Scheme
![ContractStandards.jpg](http://titiushko.github.io/SeguimientoProyectosASP/resources/ContractStandards04.jpg)

## 5.2. DATA DICTIONARY
[View the data dictionary](http://titiushko.github.io/SeguimientoProyectosASP/resources/Data Dictionary.html)
