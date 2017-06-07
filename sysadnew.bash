user0 user1 user4 user7
      user2 user5 user8
      user3 user6 user9
# save in userlist

!/bin/sh

sudo usermod -a -G sudo user0 #add sudo user
for i in `userlist.txt `
do
echo $i
adduser $i
done


#chmdod 755 userlist.txt 
#./user1.txt

sudo groupadd admin //add user1 to 3 to admin  #creating users
sudo useradd -G admin  user1 user2 user3

sudo groupadd moderator  //add user4 to 6 to moderator
sudo useradd -G moderator user4 user5 user6

sudo groupadd student  //add user7 to 9 to student
sudo useradd -G student user7 user8 user9

#for i in 1 2 3 4 5 6 7 8 9 10
 #do 
  #mkdir folder$i
  #cat folder$i/dummy.txt

  ## copy this text to file: NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
 #don
for $user in'userlist.txt' #random text
 do
 	n=1
    max=10
     while [ "$n" -le "$max" ] 
      do
      mkdir -p "$delta/folder$n" && touch $delta/folder$n/rand.text
      echo base64 /dev/urandom | head -c 10 >rand.text
      chmod 600 $delta/folder$n/rand.text
      
      if [ $user != 'user0' ]  
        setfacl -m u:user0:rwx $delta/folder$n/rand.text 
     
      if [$user != 'user0'] || [$user != 'user1'] || [$user != 'user2'] || [$user != 'user3'] ||  
        setfacl -m g:admin:rwx $delta/folder$n/rand.text
      
      if [$user == 'user7'] || [$user != 'user8'] || [$user != 'user9']
        setfacl -m g:moderator:rwx $delta/folder$n/rand.text  

        n=`expr "$n" + 1`
      done

 done

exit