You are working on the existing Android project called Blind Tracking Guide.
1. This is an existing Android application, not a new project.
2. The UI has already been developed by another developer.
3. Your task is to add backend functionality without redesigning the UI.
4. Do not replace the existing UI unless absolutely necessary.
5. Do not delete existing screens.
6. Do not create duplicate screens.
7. Preserve existing layouts, colors, buttons, icons, navigation, and user flow.
8. First inspect the entire project before making changes.
9. Identify the Android architecture currently used by the project.
10. Identify whether the source code uses Java or Kotlin.
11. The project documentation specifies Java and XML.
12. Verify the actual source code before assuming anything.
13. Inspect the root build.gradle.kts file.
14. Inspect settings.gradle.kts.
15. Inspect app/build.gradle.kts.
16. Inspect gradle.properties.
17. Inspect AndroidManifest.xml.
18. Inspect the complete app/src/main directory.
19. Inspect all existing Activities.
20. Inspect all existing Fragments.
21. Inspect all XML layouts.
22. Inspect navigation configuration.
23. Inspect existing model classes.
24. Inspect existing utility classes.
25. Inspect existing services.
26. Inspect existing Google Maps code.
27. Inspect existing GPS/location code.
28. Inspect existing authentication code.
29. Inspect existing Firebase code.
30. Inspect existing dependencies.
31. Determine which Firebase libraries are already installed.
32. Determine which Firebase libraries are missing.
33. Do not duplicate dependencies.
34. Do not downgrade existing dependencies.
35. Do not randomly upgrade Gradle.
36. Do not change the Android Gradle Plugin unnecessarily.
37. Preserve the current compile configuration.
38. Preserve the current target SDK.
39. Preserve the current minimum SDK.
40. Create an implementation plan after inspecting the project.
41. Do not start implementing unrelated features in this phase.
42. This phase focuses on Firebase foundation and authentication.
43. Use Firebase as the backend.
44. Use Firebase Authentication for user authentication.
45. Use Firebase Realtime Database for user data.
46. Firebase Storage may be configured later if required.
47. Firebase Cloud Messaging will be implemented in a later phase.
48. Cloud Functions will be considered in a later phase.
49. Do not create a Node.js backend.
50. Do not create an Express backend.
51. Do not create a separate MySQL backend.
52. Do not create a separate PostgreSQL backend.
53. Use Firebase services as the primary backend.
54. Check the Android application ID.
55. Determine the exact package name.
56. Firebase configuration must match the actual application ID.
57. Check whether google-services.json already exists.
58. If google-services.json exists, inspect whether it is correctly placed.
59. If google-services.json is missing, do not fabricate one.
60. Do not invent Firebase project IDs.
61. Do not invent Firebase API keys.
62. Do not invent Firebase credentials.
63. If configuration is missing, tell me exactly what must be added manually.
64. The expected location is app/google-services.json.
65. Configure the Google Services Gradle plugin if required.
66. Add Firebase BoM if appropriate for the current project.
67. Use compatible Firebase library versions.
68. Do not introduce incompatible dependencies.
69. Sync Gradle after Firebase configuration.
70. Build the project after configuration.
71. Fix any compilation errors caused by your changes.
72. Do not ignore Gradle errors.
73. Do not claim success if the project does not compile.
74. Configure Firebase Authentication.
75. Use email/password authentication if the existing UI supports email/password.
76. Inspect the existing registration screen.
77. Identify its input fields.
78. Inspect the existing login screen.
79. Identify its input fields.
80. Connect the existing registration button.
81. Do not create a new registration screen.
82. Validate registration input.
83. Validate the email format.
84. Validate password requirements.
85. Validate required fields.
86. Show errors using the existing UI style.
87. Do not crash on invalid input.
88. Create the Firebase Authentication account.
89. Retrieve the authenticated Firebase UID.
90. Never store passwords in Realtime Database.
91. Never log passwords.
92. Never store passwords in SharedPreferences.
93. Create a user record after successful registration.
94. Store the user record under the Firebase UID.
95. Use UID as the primary user identifier.
96. Do not use email as the database key.
97. Create a users node.
98. Use users/{uid} as the user profile path.
99. Store the user's name.
100. Store the user's email.
101. Store the user's phone if the UI contains a phone field.
102. Store profileImageUrl only if applicable.
103. Store userType only if the application already supports user types.
104. Store createdAt.
105. Store updatedAt.
106. Do not store unnecessary personal information.
107. Preserve the existing registration navigation.
108. Navigate to the existing home screen after successful registration.
109. Inspect the existing login screen.
110. Connect the existing login button.
111. Authenticate using Firebase Authentication.
112. Handle incorrect credentials.
113. Handle invalid email.
114. Handle disabled account.
115. Handle network errors.
116. Show meaningful errors.
117. Do not expose internal Firebase error details unnecessarily.
118. Navigate to the existing home screen after successful login.
119. Implement authentication session checking.
120. If the user is already authenticated, preserve the existing session behavior.
121. Do not force the user to log in repeatedly.
122. Implement logout.
123. Connect the existing logout control if available.
124. Sign out using Firebase Authentication.
125. Return to the existing login screen.
126. Prevent authenticated screens from being accessible after logout.
127. Implement password reset if the existing UI contains forgot-password functionality.
128. Use Firebase password-reset functionality.
129. Do not implement custom password-reset logic.
130. Do not store reset tokens manually.
131. Inspect the existing profile screen.
132. Connect it to Firebase Realtime Database.
133. Load the current user's profile using Firebase UID.
134. Display the stored name.
135. Display the stored email.
136. Display the stored phone if available.
137. Display profile image if already supported.
138. Preserve the existing profile UI.
139. Implement profile editing if the existing UI supports it.
140. Validate edited profile information.
141. Save updated profile information to Firebase.
142. Update updatedAt after profile modification.
143. Reload profile information correctly.
144. Handle database read errors.
145. Handle database write errors.
146. Show loading state while retrieving data.
147. Avoid infinite loading states.
148. Handle missing profile data gracefully.
149. Do not crash when optional fields are missing.
150. Create clean Firebase data-access code.
151. Do not put all Firebase logic inside one Activity.
152. Reuse the existing project architecture.
153. Create appropriate repository/helper/service classes if needed.
154. Keep UI logic separate from Firebase logic.
155. Use asynchronous Firebase operations correctly.
156. Handle lifecycle issues correctly.
157. Avoid memory leaks.
158. Avoid duplicate Firebase listeners.
159. Remove listeners when appropriate.
160. Do not create unnecessary background services.
161. Do not modify unrelated features.
162. Do not implement SOS in this phase.
163. Do not implement FCM in this phase.
164. Do not implement live location in this phase.
165. Do not implement obstacle detection in this phase.
166. Do not redesign Google Maps in this phase.
167. Focus only on the Firebase foundation.
168. Create a basic Realtime Database structure.
169. Use users/{uid} as the main profile location.
170. Ensure authenticated users can access their own profile.
171. Prepare the structure for future location data.
172. Prepare the structure for future emergency contacts.
173. Prepare the structure for future SOS data.
174. Do not implement those future features yet.
175. Add appropriate Firebase database security rules if rules are available in the project.
176. Do not make the database publicly writable.
177. Do not use unrestricted read/write rules for production.
178. Require authentication for user data.
179. Users should access their own user record.
180. Do not expose another user's private profile data.
181. Build the application.
182. Fix all compilation errors.
183. Fix all Firebase initialization errors.
184. Fix authentication integration errors.
185. Fix navigation errors caused by authentication.
186. Verify registration flow.
187. Verify login flow.
188. Verify logout flow.
189. Verify profile loading.
190. Verify profile updating.
191. Verify application restart behavior.
192. Verify authentication persistence.
193. Verify Firebase database persistence.
194. Do not proceed to unrelated functionality.
195. At the end, provide a summary of files changed.
196. Provide a summary of Firebase configuration required.
197. Clearly identify anything that could not be completed.
198. Clearly identify any manual Firebase Console steps I must perform.
199. Confirm whether the project builds successfully.
200. Stop after completing this phase and wait for my next prompt.