<?php

 //general
 messages('S_REQUIRED','info','is required!');
 messages('REQUIRED','danger','Fill the required fields.');
 messages('SOME_WRONG','danger','Somthing Wrong! Please Try again.');
 messages('CONTACT_SENT','success','Your message was sent successfully!');
 messages('SMALL_BALANCE','danger',"You don't have enought balance to withdraw.");
 messages('WITHDRAWN','success','Amount have been successfully withdrawn.');
 messages('SMALL_AD_BALANCE','danger',"You don't have enought advertising balance to order.");

 //offers
 messages('CREDITS_EARNED_ONE','success','credits and ');
 messages('CREDITS_EARNED_TWO','success',' points have been added to your account!');
 messages('WRONG_ANSWER','danger','Wrong Answer!');
 messages('POINTS_CONVERTED','success','Your point has been converted');
 messages('POINTS_NOT_ENOUGHT','danger','You must have at least '.do_config(59).' points');

 //forgot password
 messages('USRNOT_FOUND','danger','Username not found');
 messages('RECOVERED','success','Password recovered and has been sent to your email.');
 messages('INRECOVER','danger','Sorry! Something went wrong.');

 //settings
 messages('PERSONAL','success','Your personal information was updated.');
 messages('PASS_CHANGED','success','Your password was changed.');
 messages('PASS_NOTMATCH','danger','Passwords Not Match.');
 messages('PASS_UNCHANGE','danger','Entered Current Password Is Wrong.');

 //login
 messages('INVALID','danger','Username/Password Wrong!');
 messages('BANNED','danger','Account Banned!');
 messages('PENDING','danger','Account Pending! Activate Your Account First.');
 messages('RECAPTCHA','danger','Captcha Wrong! Please Try again.');
 messages('REPEAT','danger','Please choose another username.');
 messages('EXPRESS','success','Please Login First.');
 messages('ACTIVATED','success','Account Activated! Please Login First.');
 messages('EXPIRED','warning','Your Session Expired!');

 //register
 messages('SENT','info','Please Check your email inbox and confirm your account.');
 messages('PASSWORDS','danger','Passwords do not match.');
 messages('EXIST','danger','Email already exist. Please choose another one.');
 messages('WHITESPACE','danger',"Make sure your username doesn't contain whitespace");