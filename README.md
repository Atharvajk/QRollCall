# QRollCall
Link to download app: [QRollCall App](https://drive.google.com/file/d/1u3wLShJ-Uf8RgTedz56OGgTuqkvM7Ha8/view?usp=drive_link)

ACKNOWLEDGEMENT

We would like to express our heartfelt gratitude and appreciation to all those who have supported and contributed to the completion of this project. Their assistance, guidance, and encouragement have been invaluable throughout this journey. 

First and foremost, we extend our deepest thanks to our project supervisor, **Prof. Kimaya Urane** for their unwavering support, expertise, and valuable insights. Their guidance and mentorship have been instrumental in shaping this project and enhancing its quality. 

We would also like to express our sincere appreciation to our institute, Pune Institute of Computer Technology, for providing us with the necessary resources, facilities, and opportunities to carry out this project. The infrastructure and access to research materials have significantly contributed to the successful execution of this endeavor. 

Furthermore, we would like to acknowledge the assistance and cooperation of our colleagues and classmates, who provided us with valuable insights and feedback during various stages of this project. Their collaboration and discussions have been immensely helpful in refining our ideas and overcoming challenges. We would also like to extend our gratitude to the participants and respondents who generously gave their time and provided valuable data for this project. Their cooperation and willingness to share their experiences have been crucial in enriching the findings and analysis. 

In conclusion, this project would not have been possible without the support, guidance, and contributions of the individuals and organizations mentioned above. Their collective efforts have been invaluable, and we are truly indebted to them for their assistance in making this project a success. 

Thank you all once again. 

**ABSTRACT** 

The QROLLCALL (QR Code Attendance System) project addresses the challenges faced by teachers and students in traditional attendance-taking methods. This report provides a comprehensive overview of the project. 

The context of the project revolves around the inefficient and error-prone process of manually taking attendance in educational institutions. Teachers often rely on logbooks to record student attendance, leading to several issues such as misplaced records, difficulty in retrieving information, and the possibility of human error in marking attendance accurately. Conversely, students may experience the inconvenience of missing attendance due to oversight or accidental omission. 

To tackle these problems, we have developed an application that utilizes QR code technology for attendance management. The solution involves students scanning a unique QR code generated by the teacher for each class session. By scanning the QR code using their smartphones or other devices, students can conveniently mark their attendance without relying on manual entry or written records. This approach eliminates the need for logbooks and significantly reduces the likelihood of errors. 

The application not only simplifies the attendance process for both teachers and students but also offers additional benefits. It allows for efficient data management, ensuring easy access to attendance records and minimizing the time required for administrative tasks. Furthermore, the system provides a reliable and secure means of attendance tracking, as QR codes can be customized and authenticated to prevent fraudulent activities. 


**1.  INTRODUCTION** 

The QROLLCALL (QR Code Attendance System) project addresses the prevalent challenges faced by teachers and students in the realm of attendance management within educational institutions. Traditional methods of taking attendance, such as manual logbooks, have proven to be inefficient and prone to errors. Teachers often struggle with maintaining accurate records, while students occasionally encounter difficulties due to unintentional oversights in the attendance marking process. To overcome these issues, we have developed an innovative application that harnesses the power of QR code technology to revolutionize the attendance tracking process. 

Through extensive research and development, we have designed an application that enables students to mark their attendance by simply scanning a unique QR code generated by their respective teachers for each class session. This innovative approach eliminates the need for traditional logbooks, streamlining administrative tasks and reducing the likelihood of errors. Furthermore, the QR code system ensures data accuracy, enhances accessibility to attendance records, and mitigates potential instances of fraudulent activities, as the codes can be customized and authenticated. 

The QROLLCALL project represents a significant advancement in attendance management within educational institutions. By introducing a user-friendly and efficient solution, we aim to alleviate the burdens faced by teachers in maintaining attendance records while simultaneously providing students with a seamless and reliable means of marking their attendance. This report serves as a comprehensive guide to the project, offering insights into the contextual background, problem statement, solution approach, and the overarching significance of the QR Code Attendance System in addressing the existing challenges in attendance management. 

1) **Motivation** 
- **Technological Advancement:** The project aligns with the goal of leveraging technology to enhance traditional attendance management methods. It allows us to explore the potential of mobile applications, QR code scanning, and backend systems to streamline and automate attendance tracking. 
- **Practical Relevance:** Attendance management is a common and significant aspect of educational institutions. By developing a QR code-based system, we address a practical need and provide a tangible solution that can benefit teachers, students, and administrators. 
- **Efficiency Improvement:** The motivation behind the project is to improve the efficiency of attendance management processes. By replacing manual methods with a digital system, we aim to simplify attendance tracking, reduce errors, and save valuable instructional time. 
- **Student Engagement:** The project seeks to enhance student engagement by providing a modern and convenient attendance marking method. By incorporating mobile technology and QR code scanning, we aim to increase student participation and encourage a sense of responsibility towards their attendance. 
- **Academic Impact:** Accurate attendance records play a crucial role in academic analysis and decision-making. By developing an automated attendance system, we contribute to generating reliable data that can be utilized for various academic purposes, such as monitoring student progress and identifying at-risk students. 
- **Innovative Approach:** The project offers an innovative approach to address the challenges associated with attendance management. By utilizing QR codes and mobile applications, we embrace cutting-edge technology to revolutionize traditional attendance 

tracking methods. 

2) **Problem Definition** 

The QROLLCALL project addresses the inherent challenges faced by teachers and students in the process of attendance management within educational institutions. The traditional methods of manually taking attendance using logbooks result in inefficiencies, inaccuracies, and administrative burdens. Teachers struggle with the cumbersome task of maintaining accurate attendance records, often leading to errors, misplaced records, and time-consuming data retrieval. Students, on the other hand, may face the consequences of missed attendance due to unintentional oversights or accidental omissions by the teacher. These challenges highlight the pressing need for a more streamlined, efficient, and accurate attendance management solution.  

3) **Objectives** 
1. Develop an intuitive and easy-to-use application that allows teachers to generate unique QR codes for each class session, eliminating the need for manual logbooks. 
1. Enable students to mark their attendance by simply scanning the QR code using their smartphones or other devices. 
1. Ensure data accuracy and reliability by implementing robust authentication mechanisms for the generated QR codes, preventing fraudulent activities. 
1. Facilitate efficient data management by storing attendance records digitally, enabling easy access and retrieval for teachers and administrative staff. 
1. Streamline administrative tasks associated with attendance management, reducing the time and effort required for manual data entry and record maintenance. 
1. Improve overall attendance tracking efficiency, minimizing errors, and providing a comprehensive and reliable attendance history for each student.  

**3.  SOFTWARE REQUIREMENTS SPECIFICATION** 

1) **Project Scope** 
- The scope of the QROLLCALL (QR Code Attendance System) project is to develop an innovative application that revolutionizes the attendance management process within educational institutions.  
- The project aims to address the challenges faced by teachers and students in traditional attendance tracking methods by leveraging QR code technology. 
- The scope also includes implementing robust authentication mechanisms to ensure data security and privacy.  
- The application will facilitate efficient data management by storing attendance records digitally, allowing easy access and retrieval for teachers and administrative staff.  
- Overall, the QROLLCALL project's scope is to develop an application that simplifies attendance management, enhances data accuracy, and offers a seamless experience for teachers and students through the utilization of QR code technology.**  
2) **Functional Requirements**  
1. **User Registration and Authentication:** 
- Users should be able to register as teachers or students. 
- The system should authenticate users and provide secure access to their respective functionalities. 
2. **Teacher Functionality:** 
- Teachers should be able to create and manage class sessions. 
- They should have the ability to generate unique QR codes for each class session. 
- Teachers should be able to view and edit attendance records. 
3. **Student Functionality:** 
- Students should be able to scan the QR code using their smartphones or devices to mark their attendance. 
- The system should provide real-time feedback to students upon successful attendance marking. 
4. **Attendance Management:** 
- The system should record and store attendance data for each class session. 
- It should maintain a history of attendance records for future reference and analysis. 
- The system should allow teachers to view attendance reports and generate summaries based on selected time periods or classes. 
5. **Data Security and Privacy:** 
- The system should implement secure authentication mechanisms to protect user accounts and attendance data. 
- It should ensure the privacy and confidentiality of student information. 
6. **User Interface:** 
- The system should provide a user-friendly interface for both teachers and students. 
- It should be intuitive, responsive, and accessible across different devices. 
3) **Non-Functional Requirements** 
1. **Performance:** 
- The system should have fast response times to accommodate simultaneous attendance marking by multiple students. 
- It should handle a significant number of concurrent users without compromising performance. 
2. **Scalability:** 
- The system should be scalable to handle increased user and data load as the number of classes and students grow. 
- It should accommodate future expansion and support additional features or modules. 
3. **Reliability:** 
- The system should be highly reliable, ensuring uninterrupted availability during class sessions. 
- It should have backup and recovery mechanisms to prevent data loss in case of system failures or crashes. 
4. **Usability:** 
- The system should have a user-friendly interface that is easy to navigate and understand for both teachers and students. 
- It should require minimal training or technical expertise for users to operate effectively. 
5. **Security:** 
- The system should implement robust security measures to protect user accounts, attendance data, and student information. 
4) **System Requirements** 
1. **Hardware Requirements** 
1) Android or iOS device capable of running Flutter applications with latest firmware. 
1) Minimum 2 GB RAM for optimal performance. 
1) Sufficient internal storage to install the application and store data. 
1) Camera Drivers  
2. **Software Requirements** 
1) Operating System        - Android | iOS 
1) Language Used           - Dart, JS. 

   3) Compatibility with latest Flutter update 
   3) Browser latest version 
5) **System Implementation** 
1. **External Input Device :** Camera for Scanning QR-Code   
1. **Input :** Scanned QR-Code 
1. **Processing:** Unique ID of student that has Scanned QR-Code 
1. **Authentication:** Check ID is authorized or not 
1. **Response:** Acknowledge student with marked attendance 
1. **Output Device:**  Mobile Console 
1. **Output:** Attendance Marked 

**4. SYSTEM DESIGN** 

The system design of the project involves checking architecture, compability of the device with its required softwares and firmware’s. 

**4.1. High level View** 

This diagram depicts the high level abstract view of system i.e how student scans the QR-Code and mark his/her attendance. 

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.004.png)

Fig 1.1 High level View of System 

2. **System Architecture** 

This diagram depicts the architecture of the system i.e what components exist in the system, the relationship among the components and data flow between components. 

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.005.png)

Fig 1.2 System Architecture

3. **Flow Chart:** 

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.006.png)

Fig 1.3 Flow Chart

4. **Code implementation** 
1. **Initializing Attendance Process**  

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.007.png)

Fig 1.4 Initializing Attendance Process 

2. **Mark Attendance** 

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.008.png)

Fig 1.5 Mark Attendance**  

3. **JWT Authentication** 

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.009.png)

Fig 1.6 JWT Authentication** 

**4.3 Outputs ![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.010.png)![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.011.jpeg)**

`                 `Fig 1.7 Welcome Page**  

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.012.png) ![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.013.png)

Fig 1.8 Attendance Tracking and Success

![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.014.jpeg) ![](https://github.com/Atharvajk/QRollCall/blob/master/docs/Aspose.Words.7c48df83-7639-4106-860c-3e9a059a48e4.015.png)

**5. OTHER SPECIFICATIONS** 

1. **Advantages** 
1. **Improved Efficiency:**  
- The project eliminates the need for manual attendance tracking methods, such as logbooks, reducing the administrative burden on teachers.  
- Attendance marking becomes quick and seamless through QR code scanning, saving valuable instructional time. 
2. **Enhanced Accuracy:** 
- The use of QR codes ensures accurate attendance recording, minimizing errors and reducing the risk of manual entry mistakes. 
- This improves the reliability of attendance data, providing more precise records for teachers, students, and administrative staff. 
3. **Convenience for Students:**  
- The mobile application allows students to mark their attendance by simply scanning a QR code using their smartphones or devices.  
- It eliminates the need for physical attendance sheets or sign-in processes, making attendance tracking more convenient and accessible for students. 
4. **Real-time Feedback:**  
- The system provides instant feedback to students upon successful attendance marking, confirming their attendance status.  
- This immediate feedback encourages students to be proactive in attending classes and helps them stay aware of their attendance record. 
5. **Data Security and Privacy:**  
- The project ensures the security and privacy of student information by implementing secure authentication mechanisms and encrypted communication.  
- It adheres to data protection regulations and follows best practices to safeguard sensitive data. 
2. **Limitations** 
1. **Dependency on Mobile Devices:**  
- The system relies on students having access to mobile devices with QR code scanning capabilities.  
- In cases where students do not have smartphones or devices, alternative attendance marking methods may still be required. 
2. **Reliance on Network Connectivity:** 
- The application requires a stable internet connection for QR code scanning, attendance marking, and data synchronization. 
- Network connectivity issues or low signal strength can hinder the system's functionality and lead to delays or inaccuracies in attendance recording. 
3. **Device Compatibility:**  
- The mobile application developed using Flutter may not be compatible with all types of mobile devices or operating systems.  
- Some older or less common devices may experience compatibility issues, limiting the accessibility of the system for certain students. 
4. **User Adoption and Familiarity:**  
- Introducing a new attendance system may require time and effort to familiarize teachers and students with the mobile application and QR code scanning process.  
- Some individuals may face challenges in adopting the new technology, leading to potential resistance or initial difficulties in using the system effectively. 
5. **QR Code Generation and Distribution:**  
- The responsibility of generating and distributing unique QR codes for each class session lies with the teachers.  
- This process may require additional effort and organization, especially in scenarios where multiple classes or sessions are taking place simultaneously. 
6. **QR Code Scanning Accuracy:** 
- The accuracy of QR code scanning relies on factors such as lighting conditions, camera quality, and positioning of the mobile device.  
- Suboptimal scanning conditions or improper scanning techniques by students may result in failed or inaccurate attendance marking. 

**6. CONCLUSION AND FUTURE WORK** 

The proposed system gives an effective solution over traditional attendance tracking system, which gives convenience for teachers as well as students. The main aim of this system is to overcome the issues raised by traditional system.  

**Future Work:** 

1. **Facial  Recognition  Technology:**  Integration  of  facial  recognition  technology  can  be explored to automate the attendance marking process. This would involve capturing and analyzing students' facial features to verify their identities and mark attendance, offering a more seamless and contactless experience.** 
1. **Machine Learning and Predictive Analytics:** By leveraging machine learning algorithms and predictive analytics, the system can analyze attendance patterns and identify early warning signs of absenteeism or irregularities. This can enable proactive interventions to improve student attendance and success rates.** 
1. **Voice Assistant Integration:** Integration with voice assistants like Siri, Google Assistant, or Amazon Alexa can provide voice-based attendance marking and inquiry functionalities, making the system more accessible and user-friendly.** 
1. **Mobile  App  Enhancements:**  Future  iterations  of  the  mobile  application  can  include additional features such as push notifications for attendance reminders, in-app messaging for  communication  between  teachers  and  students,  and  access  to  course  materials  or resources. These enhancements would further enhance the user experience and engagement with the application.** 
1. **Geolocation  and  Geofencing  Integration:**  Integration  of  geolocation  and  geofencing technology can add an additional layer of security and attendance monitoring. By leveraging GPS or Wi-Fi technology, the system can verify student attendance based on their physical presence within a defined geographic area, ensuring greater accuracy and accountability. 


**7. REFERENCES** 

1. Blog  related  to  Manual  attendance  system  vs.  software  based  system: <https://blog.camelohq.com/manual-attendance-vs-software/>
1. Module to generate QR-Code:[ https://pub.dev/packages/qr_flutter ](https://pub.dev/packages/qr_flutter)
1. How  to  track  attendance  with  QR-Code: [ https://blog.beaconstac.com/2021/12/qr-code- attendance-tracking/ ](https://blog.beaconstac.com/2021/12/qr-code-attendance-tracking/)
1. Load Huge Data from MongoDB: [https://www.mongodb.com/community/forums/t/load- huge-data-from-mongodb/135699/3 ](https://www.mongodb.com/community/forums/t/load-huge-data-from-mongodb/135699/3)
1. How to Connect Flutter to Nodejs:[ https://betterprogramming.pub/how-to-connect-flutter- to-node-js-3e13b356c08d?gi=70cda2985d7e ](https://betterprogramming.pub/how-to-connect-flutter-to-node-js-3e13b356c08d?gi=70cda2985d7e)
