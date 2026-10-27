Continue working on the existing Blind Tracking Guide Android project.
1. Prompts 1, 2, and 3 have already been completed.
2. Do not restart the project from scratch.
3. Do not redesign the UI.
4. Do not replace working functionality unnecessarily.
5. This phase is the final integration, security, testing, and stabilization phase.
6. First inspect the entire current project.
7. Review all changes made in previous phases.
8. Identify any duplicated Firebase logic.
9. Identify duplicated location logic.
10. Identify duplicated notification logic.
11. Identify duplicated authentication logic.
12. Identify duplicated TTS logic.
13. Identify duplicated Maps logic.
14. Consolidate only where necessary.
15. Do not break existing functionality while refactoring.
16. Verify Firebase Authentication.
17. Verify Firebase Realtime Database.
18. Verify Firebase Cloud Messaging.
19. Verify Google Maps.
20. Verify GPS.
21. Verify live location.
22. Verify emergency contacts.
23. Verify SOS.
24. Verify voice assistance.
25. Verify voice commands if implemented.
26. Verify obstacle-detection integration if implemented.
27. Review Firebase Realtime Database structure.
28. Ensure users are stored under users/{uid}.
29. Ensure passwords are never stored in the database.
30. Ensure authentication uses Firebase Authentication.
31. Ensure private user data is protected.
32. Review Firebase Security Rules.
33. Do not use public read/write rules.
34. Do not use unauthenticated access for private user data.
35. Ensure authenticated users can access their own profile.
36. Ensure authenticated users can modify their own profile.
37. Ensure authenticated users can manage their own emergency contacts.
38. Ensure authenticated users can update their own location.
39. Ensure authenticated users can update their own SOS state.
40. Prevent one user from modifying another user's private data.
41. Do not expose all user locations publicly.
42. Design future caregiver access carefully.
43. Do not weaken security simply to make testing easier.
44. Review FCM implementation.
45. Ensure FCM server credentials are not in Android code.
46. Ensure service-account credentials are not in Android code.
47. Ensure private keys are not committed into the project.
48. Ensure notification processing is secure.
49. Review Cloud Functions if they were created.
50. Ensure Cloud Functions do not expose unnecessary endpoints.
51. Ensure Cloud Functions validate authentication.
52. Ensure Cloud Functions validate input.
53. Ensure Cloud Functions do not trust arbitrary client data.
54. Review Google Maps API configuration.
55. Do not fabricate API keys.
56. Ensure API keys are not unnecessarily exposed.
57. Use appropriate API restrictions where possible.
58. Review AndroidManifest.xml.
59. Remove unnecessary permissions.
60. Keep Internet permission if required.
61. Keep location permissions only if required.
62. Keep notification permission where required.
63. Keep camera permission only if obstacle detection requires it.
64. Keep microphone permission only if voice commands require it.
65. Do not request all permissions at startup.
66. Request permissions when the feature needs them.
67. Handle permission denial.
68. Handle permanent permission denial.
69. Handle disabled location services.
70. Handle disabled notifications.
71. Review lifecycle handling.
72. Check for memory leaks.
73. Check for duplicate Firebase listeners.
74. Check for duplicate location listeners.
75. Check for duplicate TTS engines.
76. Check for duplicate notification handling.
77. Ensure listeners are removed appropriately.
78. Ensure location updates stop when no longer required.
79. Ensure TTS resources are released.
80. Ensure Activities do not retain destroyed contexts.
81. Ensure background services follow Android restrictions.
82. Do not create unnecessary long-running services.
83. Review battery usage.
84. Ensure location updates are not every second unnecessarily.
85. Ensure Firebase writes are not excessive.
86. Ensure location updates use reasonable intervals.
87. Ensure location updates use reasonable distance thresholds.
88. Avoid storing unlimited location history unless required.
89. Review database size.
90. Review unnecessary Firebase writes.
91. Review error handling.
92. Authentication errors should not crash the app.
93. Database errors should not crash the app.
94. Location errors should not crash the app.
95. Maps errors should not crash the app.
96. FCM errors should not crash the app.
97. TTS errors should not crash the app.
98. Speech recognition errors should not crash the app.
99. Camera errors should not crash the app.
100. Network errors should not crash the app.
101. Use user-friendly error messages.
102. Avoid exposing raw stack traces to users.
103. Avoid logging passwords.
104. Avoid logging authentication tokens.
105. Avoid logging sensitive location data unnecessarily.
106. Review application startup.
107. Verify Firebase initializes correctly.
108. Verify authenticated users are routed correctly.
109. Verify logged-out users are routed correctly.
110. Verify authentication persistence.
111. Test new registration.
112. Test duplicate registration.
113. Test invalid email.
114. Test invalid password.
115. Test incorrect login.
116. Test successful login.
117. Test logout.
118. Test password reset if implemented.
119. Test profile loading.
120. Test profile editing.
121. Test application restart.
122. Test emergency contact creation.
123. Test emergency contact editing.
124. Test emergency contact deletion.
125. Test empty emergency contact list.
126. Test invalid phone numbers.
127. Test location permission granted.
128. Test location permission denied.
129. Test location services disabled.
130. Test location services enabled.
131. Test current location retrieval.
132. Test Firebase location write.
133. Test live location enabled.
134. Test live location disabled.
135. Test application background behavior.
136. Test application foreground behavior.
137. Test logout while location sharing is enabled.
138. Ensure user-specific listeners are removed after logout.
139. Test SOS activation.
140. Test SOS location.
141. Test SOS timestamp.
142. Test SOS database state.
143. Test SOS notification.
144. Test SOS cancellation if implemented.
145. Test repeated SOS presses.
146. Prevent duplicate emergency events where appropriate.
147. Test FCM token generation.
148. Test FCM token refresh.
149. Test foreground notification.
150. Test background notification.
151. Test notification tap.
152. Test Google Maps startup.
153. Test current location marker.
154. Test destination selection if implemented.
155. Test navigation configuration.
156. Test missing Google Maps API configuration.
157. Test voice feedback.
158. Test TTS unavailable.
159. Test voice command permission.
160. Test voice recognition failure.
161. Test obstacle detection integration if available.
162. Ensure no fake obstacle detection is claimed.
163. Test no-internet behavior.
164. Test Firebase unavailable behavior.
165. Test Maps unavailable behavior.
166. Test GPS unavailable behavior.
167. Build a debug version.
168. Fix every compilation error.
169. Fix every runtime crash discovered.
170. Fix warnings that indicate real functional problems.
171. Do not perform unnecessary cosmetic refactoring.
172. Keep existing UI design.
173. Keep existing navigation.
174. Keep existing functionality.
175. Improve only reliability and integration.
176. Verify Gradle build succeeds.
177. Verify the application launches.
178. Verify the main user flow works.
179. Verify Firebase services initialize.
180. Verify database operations work.
181. Verify authentication works.
182. Verify location works.
183. Verify SOS works.
184. Verify notifications work if configured.
185. Verify Maps works if configured.
186. Verify voice features work where supported.
187. Create a final implementation report.
188. List all important files changed.
189. List all Firebase Console settings required.
190. List all Google Maps settings required.
191. List all Cloud Function settings required if applicable.
192. List all Android permissions required.
193. List all features that are fully implemented.
194. List all features requiring external configuration.
195. List any remaining limitations.
196. Clearly distinguish implemented features from placeholders.
197. Do not claim a feature works if it was not tested.
198. Do not remove existing project functionality.
199. Confirm the final project build status.
200. Stop after completing the final integration and provide the complete final report.