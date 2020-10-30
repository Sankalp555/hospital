# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.6.3 

* Rails version - 5.1.7

* System dependencies - Should have above ruby and rails 

* Database used - Postgres


You need to follow following instructions to get started with this app.


In postman You will see that I have properly managed doctor and patient as 2 differenct domains.

So For doctors :-

1 - doctor needs to be register himself and then login.
2 - If he wants, he can reset his password as well.
3 - He can check his already created slots.
4 - He can create new slots


Now after that Login as a patient.

1 - Patient can see all available slots in the app.
2 - He can book any preferred slot and create a appointment. After that, that slot will be booked and will not available for other patients for same date.
3 -  Patient can see all apointments created by him. In This Api, you can also give doctor_id, To fetch all appointments for specific doctor. If you dont give doctor_id, then you will get all appointments of a particular current user


I am not putting output here because input and output you can easily check in published doc. link is below.



Postman published doc link

https://documenter.getpostman.com/view/9746074/SzYW4Lcx


Postman collection url

https://www.postman.com/collections/8bd3b49e60cc3e0b6547


