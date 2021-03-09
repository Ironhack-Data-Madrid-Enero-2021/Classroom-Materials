INSERT INTO `mydb`.`cars` (`idcars`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `mydb`.`cars` (`idcars`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `mydb`.`cars` (`idcars`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `mydb`.`cars` (`idcars`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `mydb`.`cars` (`idcars`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `mydb`.`cars` (`idcars`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');






INSERT INTO `mydb`.`customers` (`idcustomers`, `name`, `phone_number`, `adress`, `city`, `state/province`, `country`, `zip/postal`) VALUES ('10001', 'Pablo Picasso', '+34 636 17 63 82', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `mydb`.`customers` (`idcustomers`, `name`, `phone_number`, `adress`, `city`, `state/province`, `country`, `zip/postal`) VALUES ('20001', 'Abraham Lincoln', '+1 305 907 7086', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `mydb`.`customers` (`idcustomers`, `name`, `phone_number`, `adress`, `city`, `state/province`, `country`, `zip/postal`) VALUES ('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');






INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00004', 'Gail Forcewind', 'Paris');
INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00005', 'Paige Turner', 'Mimia');
INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `mydb`.`SalesPerson` (`staff_id`, `name`, `store`) VALUES ('00008', 'Shonda Leer', 'São Paulo');





INSERT INTO `mydb`.`Invoices` (`idInvoices`, `number`, `date`, `car`, `customer`, `salesperson`, `customers_idcustomers`, `SalesPerson_staff_id`) VALUES ('0', '852399038', '22-08-2018', '0', '1', '3', '1', '3');
INSERT INTO `mydb`.`Invoices` (`idInvoices`, `number`, `date`, `car`, `customer`, `salesperson`, `customers_idcustomers`, `SalesPerson_staff_id`) VALUES ('1', '731166526', '31-12-2018', '3', '0', '5', '0', '5');
INSERT INTO `mydb`.`Invoices` (`idInvoices`, `number`, `date`, `car`, `customer`, `salesperson`, `customers_idcustomers`, `SalesPerson_staff_id`) VALUES ('2', ' 	271135104', '22-01-2019', '2', '2', '7', '2', '7');


