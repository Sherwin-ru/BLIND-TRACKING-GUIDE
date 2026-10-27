Preserve all currently working functionality and do not rewrite Profile, Firebase persistence, GPS/LocationService, or SOS unless Prompt 3 has a direct dependency on them.
Continue working on the existing Blind Tracking Guide Android project.
1. Prompt 1 and Prompt 2 have already been completed.
2. Preserve all previous functionality.
3. Do not redesign the existing UI.
4. Do not delete existing screens.
5. Do not create duplicate screens.
6. First inspect the current project state.
7. Review Firebase Authentication.
8. Review Realtime Database.
9. Review emergency contacts.
10. Review GPS/location implementation.
11. Review live-location sharing.
12. Review existing Google Maps code.
13. Review existing voice-assistance code.
14. This phase focuses on SOS, FCM, Maps, and voice assistance.
15. Do not undo existing Firebase functionality.
16. Use Firebase Cloud Messaging for push notifications.
17. Add the required Firebase Messaging dependency.
18. Use a Firebase-compatible version.
19. Do not duplicate dependencies.
20. Configure Firebase Messaging.
21. Create the required Firebase messaging service.
22. Handle FCM token creation.
23. Handle FCM token refresh.
24. Store the current user's FCM token securely.
25. Store tokens under the authenticated user's Firebase UID.
26. Do not store tokens under public database paths.
27. Do not expose server credentials inside the Android app.
28. Do not hard-code FCM server keys.
29. Do not place service-account credentials in the APK.
30. Inspect the existing notification architecture.
31. Handle foreground notifications.
32. Handle background notifications.
33. Handle notification taps.
34. Open the appropriate existing screen when a notification is tapped.
35. Use meaningful notification titles.
36. Use concise notification messages.
37. Now implement the SOS functionality.
38. Inspect the existing SOS button.
39. Connect the existing SOS button.
40. Do not create a replacement SOS screen.
41. When SOS is pressed, obtain the latest reliable location.
42. If no recent location exists, request a location update.
43. If location cannot be obtained, handle the situation gracefully.
44. Do not send fake coordinates.
45. Store SOS state in Realtime Database.
46. Use users/{uid}/sos.
47. Store active status.
48. Store latitude.
49. Store longitude.
50. Store timestamp.
51. Store an emergency message.
52. Use a clear emergency state.
53. Prevent accidental repeated SOS operations.
54. If the existing UI supports confirmation, preserve it.
55. If the existing UI does not support confirmation, do not redesign the screen unnecessarily.
56. Provide voice feedback after SOS activation.
57. Notify the appropriate emergency contacts.
58. Use a secure backend mechanism for sending notifications.
59. Do not send FCM server credentials from the mobile app.
60. If direct device-to-device notification requires Cloud Functions, use Cloud Functions.
61. Do not implement insecure client-side notification sending.
62. The mobile app should write the SOS event securely.
63. A trusted backend can process the SOS event.
64. The trusted backend can identify recipient device tokens.
65. The trusted backend can send FCM notifications.
66. Emergency recipients should receive an emergency notification.
67. The notification should contain appropriate information.
68. Avoid exposing unnecessary personal information.
69. Include location information only when required.
70. If a map link is used, generate it from the actual coordinates.
71. Do not hard-code map URLs.
72. Do not expose private credentials.
73. Implement SOS cancellation if the existing UI supports cancellation.
74. Set active to false when SOS is cancelled.
75. Stop repeated notification processing after cancellation where appropriate.
76. Prevent duplicate SOS events.
77. Handle database failures.
78. Handle FCM failures.
79. Handle network failures.
80. Handle missing emergency contacts.
81. Handle missing recipient tokens.
82. Show appropriate feedback.
83. Now inspect Google Maps integration.
84. Preserve the existing map UI.
85. Do not redesign the map unnecessarily.
86. Connect the map to the actual GPS location.
87. Display the current user location.
88. Update the marker when location changes.
89. Do not hard-code the user's location.
90. Do not create fake navigation paths.
91. Inspect existing Google Maps API configuration.
92. If the API key is missing, do not fabricate one.
93. Tell me exactly where the API key must be configured.
94. Use the existing Maps configuration if already present.
95. Ensure the Maps SDK is correctly initialized.
96. Handle Maps initialization failure.
97. Handle missing location permission.
98. Handle GPS disabled.
99. Preserve existing map controls.
100. Implement destination selection if the existing UI already provides it.
101. Use the actual current location.
102. Use the actual selected destination.
103. Generate navigation data using supported Google APIs if configured.
104. Do not pretend navigation works without required API configuration.
105. Clearly identify missing Google API services.
106. Implement voice guidance.
107. Inspect the existing voice/TTS implementation.
108. Reuse existing voice classes where possible.
109. Do not create duplicate TTS engines.
110. Provide voice feedback for important events.
111. Provide voice feedback when navigation starts.
112. Provide voice feedback for current location if requested.
113. Provide voice feedback for destination reached.
114. Provide voice feedback for GPS unavailable.
115. Provide voice feedback for SOS activated.
116. Provide voice feedback for SOS cancelled.
117. Provide voice feedback for important errors.
118. Keep spoken messages concise.
119. Avoid excessive repeated announcements.
120. Properly release TTS resources.
121. Handle device TTS unavailable.
122. Handle unsupported language.
123. Preserve the existing accessibility-oriented UI.
124. Inspect voice command functionality.
125. If voice commands already exist, connect them to actual functionality.
126. Possible commands include start navigation.
127. Possible commands include stop navigation.
128. Possible commands include current location.
129. Possible commands include SOS.
130. Possible commands include cancel SOS.
131. Possible commands include share location.
132. Do not implement commands that conflict with existing UI.
133. Do not create a fake voice-recognition system.
134. Use Android-supported speech recognition.
135. Request microphone permission only when required.
136. Handle microphone permission denial.
137. Handle speech recognition failure.
138. Handle no speech detected.
139. Handle unsupported speech recognition.
140. Preserve existing application navigation.
141. Now inspect obstacle detection.
142. Determine whether an actual obstacle detection model already exists.
143. If an actual model exists, integrate it.
144. Do not create random or fake obstacle detection.
145. If no model exists, create a clean integration interface.
146. The interface should allow a future ML model to report obstacles.
147. Connect obstacle events to voice warnings.
148. Do not claim real obstacle detection if no model exists.
149. Do not add a fake camera AI implementation.
150. Preserve existing camera functionality if present.
151. Handle camera permission only if required.
152. Ensure SOS can work independently of obstacle detection.
153. Ensure navigation can work independently of obstacle detection.
154. Ensure authentication remains functional.
155. Ensure emergency contacts remain functional.
156. Ensure location sharing remains functional.
157. Build the project.
158. Fix all compilation errors.
159. Fix manifest errors.
160. Fix Firebase Messaging errors.
161. Fix Maps errors.
162. Fix TTS errors.
163. Fix permission errors.
164. Test FCM token generation.
165. Test token refresh.
166. Test foreground notification.
167. Test background notification.
168. Test SOS database update.
169. Test SOS notification.
170. Test SOS location data.
171. Test SOS cancellation if implemented.
172. Test Google Maps initialization.
173. Test current location marker.
174. Test destination functionality if configured.
175. Test voice feedback.
176. Test voice commands if implemented.
177. Test permission denial.
178. Test network failure.
179. Test Firebase failure.
180. Verify no private credentials are inside the Android source.
181. Verify no FCM server key is inside the app.
182. Verify no fake API keys are used.
183. Verify existing UI remains intact.
184. Verify previous Firebase features remain functional.
185. Document Firebase Console configuration.
186. Document Google Maps API configuration.
187. Document FCM configuration.
188. Document Cloud Function requirements if used.
189. Document any missing external configuration.
190. Document files changed.
191. Report build status.
192. Report authentication status.
193. Report database status.
194. Report location status.
195. Report SOS status.
196. Report notification status.
197. Report Maps status.
198. Report voice status.
199. Do not claim incomplete functionality is complete.
200. Stop after completing this phase and wait for Prompt 4.