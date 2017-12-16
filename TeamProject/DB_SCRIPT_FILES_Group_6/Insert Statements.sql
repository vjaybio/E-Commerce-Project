---------------------------------INSERT statements------------------------------

----------------------------------Shopper Table---------------------------------

INSERT INTO Shopper   
VALUES (
    USERID_SEQ.NEXTVAL,
    'Rachel',
    'Green',
    'rachelgreen@gmail.com',
    'rachel',
    '404123456',
    '1654 Terell Mill Road',
    'Atlanta',
    'GA',
    30039,
    '4567435212348765',
    '234',
    TO_DATE('01/10/2025','mm/dd/yyyy'));
    
INSERT INTO Shopper   
VALUES (
    USERID_SEQ.NEXTVAL,
    'Monica',
    'Geller',
    'monicageller@gmail.com',
    'monica',
    '4041234678',
    '1654 Akers Mill Road',
    'Atlanta',
    'GA',
    30037,
    '987678904321',
    '654',
    TO_DATE('02/10/2025','mm/dd/yyyy'));
    
INSERT INTO Shopper   
VALUES (
    USERID_SEQ.NEXTVAL,
    'Phoebe',
    'Buffay',
    'phoebebuffay@gmail.com',
    'phoebe',
    '4041237896',
    '1634 Bridge Mill Dr',
    'Atlanta',
    'GA',
    30039,
    '1234765498762345',
    '879',
    TO_DATE('03/10/2025','mm/dd/yyyy'));

INSERT INTO Shopper   
VALUES (
    USERID_SEQ.NEXTVAL,
    'Ross',
    'Geller',
    'rossgeller@gmail.com',
    'ross',
    '4047868897',
    '1634 Lenox Rd',
    'Atlanta',
    'GA',
    30023,
    '3454765789563345',
    '385',
    TO_DATE('04/10/2025','mm/dd/yyyy'));
    
INSERT INTO Shopper   
VALUES (
    USERID_SEQ.NEXTVAL,
    'Chandler',
    'Bing',
    'chandlerbing@gmail.com',
    'chandler',
    '4047869876',
    '1634 Lenox Rd',
    'Atlanta',
    'GA',
    30023,
    '6576435489097687',
    '564',
    TO_DATE('05/10/2025','mm/dd/yyyy'));
    
INSERT INTO Shopper   
VALUES (
    USERID_SEQ.NEXTVAL,
    'Joey',
    'Tribbiani',
    'joeytribbiani@gmail.com',
    'joey',
    '4046775456',
    '1645 Lenox Rd',
    'Atlanta',
    'GA',
    30023,
    '4565675687796754',
    '274',
    TO_DATE('06/10/2025','mm/dd/yyyy'));

--------------------------------Product table-----------------------------------

INSERT INTO PRODUCT 
VALUES(5001,
'Purina Beyond Natural Dry Dog Food',
'Every dog deserves great nutrition. That’s why Beyond offers grain free solutions you’re looking for. Our Grain Free Beef and Egg Recipe is made with simple, natural ingredients plus vitamins and minerals. Real beef is the first ingredient, a source of protein and essential amino acids. So your dog gets all the nourishment he needs and nothing he doesn’t.',
'Purina Beyond',
32.55,
201,
'https://studentgsu-my.sharepoint.com/personal/vkuttagulveeresh1_student_gsu_edu/_layouts/15/onedrive.aspx?slrid=02531f9e-f021-4000-7a48-3b8700554158&FolderCTID=0x0120005A4BFE7484588F46A635C211DAE5BE7E&id=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images%2FPurina%2Ejpg&parent=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images'
);
                                        
INSERT INTO PRODUCT
VALUES (5002,
'PEDIGREE Complete Nutrition Adult Dry Dog Food',
'PEDIGREE Adult Complete Nutrition Roasted Chicken, Rice & Vegetable Flavor Dry Dog Food is formulated to give dogs all of the energy and nourishment they need to continue living life to the fullest. This chicken-flavor dog food is packed with B vitamins, zinc and omega-6 fatty acid to help keep adult dogs looking their best. Now with no high fructose corn syrup, no artificial flavors, and no added sugar. PEDIGREE Dry Dog Food also contains leading levels of the antioxidant, vitamin E, to help keep adult dogs immune systems strong. Plus, this balanced dog food features our special fiber blend, which helps promote healthy digestion, to keep yard patrol in control. Feed your dog this oral care kibble to help keep teeth clean and give them a great taste.',
'Pedigree',
27.85,
167,
'https://studentgsu-my.sharepoint.com/personal/vkuttagulveeresh1_student_gsu_edu/_layouts/15/onedrive.aspx?slrid=02531f9e-f021-4000-7a48-3b8700554158&FolderCTID=0x0120005A4BFE7484588F46A635C211DAE5BE7E&id=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images%2FPedigree%2Ejpg&parent=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images'
);

INSERT INTO PRODUCT
VALUES(5003, 
'Rachael Ray Nutrish Natural Dry Dog Food',
'Rachael Ray Nutrish Real Chicken & Veggies Recipe is made with simple, natural ingredients, like real U.S. farm-raised chicken, which is always the number one ingredient, combined with wholesome vegetables and added vitamins & minerals. Every ingredient has a purpose. Thats why we carefully select high-quality proteins like chicken, beef and seafood, and then combine them with wholesome veggies and essential vitamins and minerals. A portion of proceeds from each sale of Nutrish is donated to The Rachael Ray Foundation, which helps animals in need through Rachaels Rescue. Through September 2017, Rachaels Rescue has donated more than $21 million to pet charities and other organizations that do good for pets. The funds are used for food, medical supplies, treatments and more for animals in need. When you buy a bag of Nutrish you can feel good knowing that Rachaels personal proceeds from sales of Nutrish go to Rachaels Rescue, providing food, medical supplies and treatment for animals in need.',
'Rachel Ray Nutrish',
41.25,
312,
'https://studentgsu-my.sharepoint.com/personal/vkuttagulveeresh1_student_gsu_edu/_layouts/15/onedrive.aspx?slrid=02531f9e-f021-4000-7a48-3b8700554158&FolderCTID=0x0120005A4BFE7484588F46A635C211DAE5BE7E&id=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images%2FNutrish%2Ejpg&parent=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images'
);


INSERT INTO PRODUCT
VALUES(5004,
'Natural Ultramix Adult Dry Dog Food',
'At Castor & Pollux Natural PetWorks, we are obsessed with dog and cat nutritional health. For over a decade, we have made innovative and high-quality food and treats for pets that pet parents love feeding. We use only the highest quality ingredients and we test and re-test every food product to ensure its safety. We believe natural is better and no one does natural and organic like we do. Natural Ultramix brand is a natural way to provide complete and essential nutrition for pets. Dry formulas provide natural sources of vitamins, minerals, fiber and antioxidants with real pieces of minimally processed fruits and vegetables for your dog. Only the highest quality proteins, like natural salmon, chicken, duck or beef are used as the #1 ingredient in our formulas. And added omega fatty acides help promote healthy skin and a luxurious coat. There is no wheat, corn, soy or fillers, and never any ingredients from China in any of our recipes.',
'Natural Ultramix',
35.40,
421,
'https://studentgsu-my.sharepoint.com/personal/vkuttagulveeresh1_student_gsu_edu/_layouts/15/onedrive.aspx?slrid=02531f9e-f021-4000-7a48-3b8700554158&FolderCTID=0x0120005A4BFE7484588F46A635C211DAE5BE7E&id=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images%2FUltramix%2Ejpg&parent=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images'
);

INSERT INTO PRODUCT
VALUES(5005,
'Merrick Grain Free Dry Dog Food',
'The Best Dog Ever deserves the Best Food Ever. That’s why Merrick’s grain-free recipes provide only the best to your best friend in quality, nutrition and taste. Merrick Grain-Free recipes start with real deboned meat, fish or poultry as the #1 ingredient for a high protein, nutritious grain-free meal, along with farm-fresh fruits and vegetables like sweet potatoes, blueberries, peas and more. Dogs thrive on quality protein and healthy fats. That is why Merrick Grain Free Real Duck & Sweet Potato Dry Dog Food provides balanced nutrition with real whole foods sourced from local farmers. This natural, grain-free formula dog food is ideal for all life stages and all breeds of dogs with a focus on naturally nutrient rich ingredients to support overall health. Deboned buffalo is the first ingredient and helps comprise the 70% of meat and fish sourced ingredients that help build and maintain lean, healthy muscle tissue with high quality protein, support healthy skin and coat with omega fatty acids and support joint health with glucosamine.',
'Merrick',
21.35,
305,
'https://studentgsu-my.sharepoint.com/personal/vkuttagulveeresh1_student_gsu_edu/_layouts/15/onedrive.aspx?slrid=02531f9e-f021-4000-7a48-3b8700554158&FolderCTID=0x0120005A4BFE7484588F46A635C211DAE5BE7E&id=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images%2FMerrick%2Ejpg&parent=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images'
);

INSERT INTO PRODUCT
VALUES(5006,
'Kibbles n Bits Beef Steak Flavor Dry Dog Food',
'As part of our Chefs Choice line of culinary-inspired foods, every bite of Kibbles ‘n Bits American Grill dry dog food tastes like a backyard barbeque! Thoughtfully prepared with grilled beef steak flavor and potatoes, then touched with the taste of real cheddar cheese, this meal is made with high-quality ingredients that offer your dog complete, balanced nutrition. Its a deliciously satisfying meal you can feel good about serving your dog every day',
'Kibbles n Bits',
12.45,
267,
'https://studentgsu-my.sharepoint.com/personal/vkuttagulveeresh1_student_gsu_edu/_layouts/15/onedrive.aspx?slrid=d65c1f9e-b0f9-4000-7a48-3cad15de94b2&FolderCTID=0x0120005A4BFE7484588F46A635C211DAE5BE7E&id=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images%2FKibbles%20n%20Bits%2Ejpg&parent=%2Fpersonal%2Fvkuttagulveeresh1_student_gsu_edu%2FDocuments%2FDBMS%20Project%20Images'
);

---------------------------------Review Table-----------------------------------

INSERT INTO Review   
VALUES (
    REVIEWID_SEQ.NEXTVAL,
    5001,
    1001,
    5,
    'Outstanding Product ! '
    );
    
INSERT INTO Review   
VALUES (
    REVIEWID_SEQ.NEXTVAL,
    5001,
    1003,
    5,
    'A must have for all Dogs ! '
    );
    
INSERT INTO Review   
VALUES (
    REVIEWID_SEQ.NEXTVAL,
    5003,
    1005,
    3,
    'Palatable, but not nutritious. '
    );
    
INSERT INTO Review   
VALUES (
    REVIEWID_SEQ.NEXTVAL,
    5004,
    1002,
    5,
    'My dog loves it ! '
    );
    
------------------------------SELECT STATEMENTS---------------------------------

SELECT * from shopper;

SELECT * from product;

SELECT * from review;

--------------------------------------------------------------------------------