-----------------------------sequence creation----------------------------------
CREATE SEQUENCE userid_seq 
START WITH 1001 
INCREMENT BY 1;

CREATE SEQUENCE finalorderid_seq 
START WITH 7001 
INCREMENT BY 1;

CREATE SEQUENCE cartid_seq 
START WITH 3001 
INCREMENT BY 1;

CREATE SEQUENCE reviewid_seq 
START WITH 9001 
INCREMENT BY 1;

CREATE SEQUENCE payment_seq 
START WITH 11001 
INCREMENT BY 1;


-----------------------------create table statements----------------------------
CREATE TABLE Shopper (
    UserID             INT NOT NULL,
    Fname              VARCHAR2(50) NOT NULL,
    Lname              VARCHAR2(50) NOT NULL,
    email              VARCHAR2(50) NOT NULL,
    password           VARCHAR2(50) NOT NULL, 
    phone              VARCHAR2(50),
    street             VARCHAR2(300),
    city               VARCHAR2(50),
    state              VARCHAR2(50),
    zip                INT NOT NULL,
    cardnumber         VARCHAR2(50) NOT NULL,
    CVV                INT NOT NULL,
    expirydate        DATE NOT NULL,      
    CONSTRAINT Userid_pk 
        PRIMARY KEY ( UserID )
);


CREATE TABLE Product (
    ProductID          INT NOT NULL,
    Pname              VARCHAR2(1000) NOT NULL,
    description        VARCHAR2(4000) NOT NULL,
    supplier           VARCHAR2(100) NOT NULL,
    price              FLOAT NOT NULL, 
    stock              INT NOT NULL,        
    image              VARCHAR2(2000),
    CONSTRAINT Productid_pk 
        PRIMARY KEY ( ProductID )
);


CREATE TABLE Cart (
    CartID          INT NOT NULL,
    ProductID       INT NOT NULL,
    UserID          INT NOT NULL,
    Qty             INT NOT NULL,           
    CONSTRAINT CartID_pk 
        PRIMARY KEY ( CartID, ProductID ),
    CONSTRAINT fk_Productid  
        FOREIGN KEY (ProductID)  
            REFERENCES Product(ProductID)  
                ON delete cascade ,
    CONSTRAINT fk_Userid  
        FOREIGN KEY (UserID) 
            REFERENCES Shopper(UserID) 
                ON delete cascade  
);


CREATE TABLE Review (
    ReviewID        INT NOT NULL,
    ProductID       INT NOT NULL,
    UserID          INT NOT NULL,
    Rating          INT NOT NULL,
    ReviewDescription Varchar2(1000),
    CONSTRAINT ReviewID_pk 
        PRIMARY KEY ( ReviewID ),
    CONSTRAINT fk_ReviewProductid  
        FOREIGN KEY (ProductID)   
            REFERENCES Product(ProductID) 
                ON delete cascade ,
    CONSTRAINT fk_ReviewUserid  
        FOREIGN KEY (UserID)   
            REFERENCES Shopper(UserID) 
                ON delete cascade
);   

CREATE TABLE ProductORDER(
    ORDERID INT NOT NULL,
    PRODUCTID INT NOT NULL,
    QTY INT NOT NULL,
    CONSTRAINT ORDERID_PK 
        PRIMARY KEY(ORDERID, PRODUCTID),
    CONSTRAINT FK_PRODUCTID_FINALORDER 
        FOREIGN KEY(PRODUCTID) 
            REFERENCES PRODUCT(PRODUCTID) 
                ON delete cascade                  
);
    
                    
CREATE TABLE FinalORDER(
    ORDERID INT NOT NULL,
    USERID INT NOT NULL,
    SH_STREET VARCHAR2(50) NOT NULL,
    SH_CITY VARCHAR2(50) NOT NULL,
    SH_STATE VARCHAR2(50) NOT NULL,
    SH_ZIP INT NOT NULL,
    SH_PHONE VARCHAR2(50) NOT NULL,
    Tax FLOAT NOT NULL,
    Subtotal FLOAT NOT NULL,
    Orderstatus VARCHAR(100),
    Orderdate DATE NOT NULL,
    LastModifiedDate DATE,
    Expected_arrival DATE,
    CONSTRAINT FinalORDERID_PK 
        PRIMARY KEY(ORDERID),                    
    CONSTRAINT FK_USERID_FINALORDER 
        FOREIGN KEY(USERID) 
            REFERENCES SHOPPER(USERID) 
                ON delete cascade
);
        

CREATE TABLE PAYMENT(
    PAYMENTID INT NOT NULL,
    ORDERID   INT NOT NULL,
    P_CARDNUMBER VARCHAR2(50) NOT NULL,
    P_NAME_ON_CARD VARCHAR2(50) NOT NULL,
    P_CARDTYPE VARCHAR2(50) NOT NULL,
    P_EXPIRYDATE DATE NOT NULL,
    P_CVV INT NOT NULL,    
    CONSTRAINT PAYMENTID_PK 
        PRIMARY KEY(PAYMENTID),
    CONSTRAINT FK_ORDERID_PAYMENT  
        FOREIGN KEY (ORDERID) 
            REFERENCES FINALORDER(ORDERID) 
                ON delete cascade
);