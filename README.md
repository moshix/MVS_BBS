[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fmoshix%2FMVS_BBS&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

# MVS BBS
This is a BBS (bulletin board system) for MVS 3.8. It can be reached by any telnet client. 

MVS BBS provides the following functions:
1. Community chat
2. User to User messagging
3. Forums
4. program download
5. user public page
6. DOORs
7. games

All written in BREXX. And it all runs on 45 year old MVS 3.8j on top of Hercules. 

How does MVS BBS work?
=======================
MVS BBS stores all its state data in a VSAM key/valey database. 
data stored inclludes:

1. User Database: This stores information about registered users, including usernames, passwords, permissions, email addresses, and other user-specific details.

2. Message Boards: These are organized sections where users can post messages and engage in discussions. Each message board typically has a title, description, and a list of threads or topics.

3. Threads: Threads are individual conversations within a message board. They contain a series of messages or posts related to a specific topic. Each thread usually has a title, the username of the original poster, and a timestamp.

4. Posts: Posts are individual messages within a thread. They contain the actual content posted by users, along with the username of the poster and a timestamp.

5. Private Messages: BBS systems often provide a feature for users to send private messages to each other. These messages are typically stored in a separate database and include the sender, recipient, message content, and timestamp.

6. User Profiles: User profiles allow users to provide additional information about themselves, such as a bio, profile picture, and other personal details. These profiles are associated with each user's account.

7. File Libraries: BBS systems often include file libraries where users can upload and download files. These libraries store information about the files, such as the filename, description, uploader, upload date, and download count.

8. Access Control Lists (ACLs): ACLs are used to control user access to various parts of the BBS system. They define permissions for different user roles, such as administrators, moderators, and regular users.



July 2023, Samedan, Switzerland



