# windows-task

Task for talent aquisition. Good luck:


01. Kreiraj novi branch koji sadrži tvoje ime.

02. U kloniranom repo folderu kreiraj radni folder sa svojim imenom kao i file structure koji ti odgovara za ovaj task

03. Na svom AWS Accountu napravi IAM usera za terraform, read-only IAM Usere,

04. Koristeći terraform kreiraj: 
	- VPC u Frankfurt zoni
	- Route 53 Privatnu zonu
	- S3 bucket
	- 1 VM za domain kontroler

05. Na VM instaliraj MS Active Directory Service i DNS server

06. Konfiguriši GPO koji će svim računarima u OU "Task Computers" dodati DNS sufix svog active direktorija

07. Koristeći powershell kreiraj bootstrap skriptu koja će svaki novi windows server, kreiran od strane terraforma:
	- dodati u Active Directory
	- skinuti neki custom powershel skript file sa s3 bucketa
	- okidati tu skrptu automatski svake subote u 00:00 na serveru

08. Koristeći terraform kreiraj wsus server i prebaci ga u AD OU "Admin Computers" 

09. Konfiguriši WSUS Server i kao file share server.

10. Kreiraj testnu mašinu koristeći terraform i prebaci je u OU "Task Computers"

11. Kreiraj domain usera i konfiguriši GPO da se moći RDPovati samo na mašine iz OU "Task Computers"

12. Strogo definisati ingress saobraćaj na windows mašinama koristeći AWS Security Groups i terraform

13. Pushaj svoj branch na github repo i napravi PR u kojem ćeš navesti kredencijale za provjeru AWS accounta i AD kredencijale

13. Bonus Tasks
	- Kreiraj Lambdu koja će raditi snapshot EBS volume-a ako Volume servera ima neki Tag (npr: Snapshot: True)
	
14. Bonus Task
	- Koristeći Terraform: kreiraj dodatni VPC i koristeći VPC Peering upari ga sa prvim VPCom
	
15. Bonus Task
	- Sve usere, pristup serverima kao i placement samih servera uraditi po security best practicima u industriji
