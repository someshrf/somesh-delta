# Create 10 users, from 0-9, such as user0, user1,.., user9.
# Users 1-3 should be admins. Users 4-6 should be moderators. Users 7-9 should be students.
# Create a folder in their each of the users' home called delta.

# The admins can access, and modify the contents of all the moderators' delta folders, and students' delta folders.
# The moderators can access, and modify the contents of all students' delta folders.
# The students can access, and modify only their own delta folders.

# Admins can not access, or modify other admins' folders.
# Moderators can not access, or modify other moderators' folders.
# Students can not access, or modify other students' folders.

# user0 is the "root" user, and can see, and modify all the admins', moderators and students' delta folders.

# Inside each delta folder, create 10 folders such as folder1, folder2,..., folder10.
# In each of those 10 folders, create a .txt file with 10 random alphanumeric characters. 




user0 user1 user4 user7
      user2 user5 user8
      user3 user6 user9
# save in userlist1.txt userlist2.txt userlist3.txt 3 separate categories

!/bin/sh

sudo usermod -a -G sudo user0 #add sudo user
for i in `userlist1.txt `
do
echo $i
adduser $i
done

for i in `userlist2.txt `
do
echo $i
adduser $i
done

for i in `userlist3.txt `
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
for i in'userlist1.txt' #random text
 do
 	n=1
    max=10
     while [ "$n" -le "$max" ] 
      do
      mkdir -p "$delta/folder$n" && touch $delta/folder$n/rand.text
      echo base64 /dev/urandom | head -c 10 >rand.text
      chmod 600 $delta/folder$n/rand.text
      
      setfacl -m u:user0:rwx $delta/folder$n/rand.text 
      n=`expr "$n" + 1`
      done

 done

for i in'userlist2.txt' #random text
 do
 	n=1
    max=10
     while [ "$n" -le "$max" ] 
      do
      mkdir -p "$delta/folder$n" && touch $delta/folder$n/rand.text
      echo base64 /dev/urandom | head -c 10 >rand.text
      chmod 600 $delta/folder$n/rand.text
      
      setfacl -m g:admin:rwx $delta/folder$n/rand.text
      setfacl -m u:user0:rwx $delta/folder$n/rand.text     
      n=`expr "$n" + 1`
      done

 done

for i in'userlist1.txt' #random text
 do
 	n=1
    max=10
     while [ "$n" -le "$max" ] 
      do
      mkdir -p "$delta/folder$n" && touch $delta/folder$n/rand.text
      echo base64 /dev/urandom | head -c 10 >rand.text
      chmod 600 $delta/folder$n/rand.text
      
      setfacl -m g:moderator:rwx $delta/folder$n/rand.text
      setfacl -m g:admin:rwx $delta/folder$n/rand.text
      setfacl -m u:user0:rwx $delta/folder$n/rand.text
      n=`expr "$n" + 1`
      done

 done

 exit 