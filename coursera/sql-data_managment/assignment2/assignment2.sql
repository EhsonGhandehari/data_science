USE Coursera;

SELECT Eventplan.eventno, eventrequest.dateheld, customer.custno, customer.custname, facility.facno, facility.facname
FROM Customer, Eventplan, Eventrequest, Facility
WHERE facility.facno=eventrequest.facno AND
	  eventrequest.custno=customer.custno AND
      eventrequest.eventno=eventplan.eventno AND
      customer.city='Boulder';
      
SELECT customer.custno, customer.custname, Eventrequest.eventno, eventrequest.dateheld, facility.facno, facility.facname, (eventrequest.estcost/eventrequest.estaudience) AS Estcostperperson
FROM Customer, Eventrequest, Facility
WHERE facility.facno=eventrequest.facno AND
	  eventrequest.custno=customer.custno AND
      Eventrequest.dateheld Between '2013/01/01' AND '2013/12/31'
      HAVING Estcostperperson<0.2;
      
      
SELECT Eventrequest.eventno, Customer.custname, Customer.custno, SUM(eventrequest.estcost) AS Sum_cost
FROM Customer, Eventrequest
WHERE eventrequest.custno=customer.custno AND eventrequest.status='Approved'
GROUP by Customer.custno;


INSERT INTO Customer(Custno, Custname,address, Internal, Contact, phone, city, state, zip) values
					('C106', 'Ehson','2250 Magnolia', 'Y', '4082219220','gooz','San Ramon','CA','94582');
                    
UPDATE RESOURCETBL

 set Rate= Rate*1.1
 WHERE Resname='nurse';
 


 
      
      
      

      
      




