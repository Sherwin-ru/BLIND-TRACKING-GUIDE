Continue working on the existing Blind Tracking Guide Android project.
1. Prompt 1 has already been completed.
2. Do not undo the Firebase Authentication implementation.
3. Do not redesign the existing UI.
4. Do not replace existing screens.
5. Do not create duplicate screens.
6. First inspect the current project state.
7. Review the Firebase implementation created in the previous phase.
8. Review the existing users/{uid} database structure.
9. Review the existing authentication flow.
10. Review the existing profile implementation.
11. Preserve all working functionality.
12. This phase focuses on Firebase data, emergency contacts, GPS, and live location.
13. Do not implement FCM notifications yet.
14. Do not implement complete SOS notifications yet.
15. FCM and advanced SOS will be handled in Prompt 3.
16. Use Firebase Realtime Database.
17. Continue using authenticated Firebase UID.
18. Do not change the primary user identifier.
19. Extend the existing database structure safely.
20. Do not delete existing user fields.
21. Add emergencyContacts under the authenticated user.
22. Use users/{uid}/emergencyContacts.
23. Each contact should have a unique contact ID.
24. Store contact name.
25. Store contact phone number.
26. Store relationship if the existing UI supports it.
27. Store only necessary contact information.
28. Inspect the existing emergency-contact UI.
29. Identify the add-contact button.
30. Identify existing contact fields.
31. Identify existing contact list.
32. Identify edit functionality if present.
33. Identify delete functionality if present.
34. Connect the existing add-contact control.
35. Validate contact name.
36. Validate phone number.
37. Reject empty required fields.
38. Save contacts to Realtime Database.
39. Use generated contact IDs.
40. Do not use phone numbers as database keys.
41. Display saved contacts in the existing UI.
42. Load contacts when the screen opens.
43. Use Firebase listeners appropriately.
44. Avoid duplicate listeners.
45. Remove listeners when the screen is destroyed if appropriate.
46. Implement editing if the existing UI supports it.
47. Update contact data without deleting unrelated fields.
48. Implement deletion if the existing UI supports it.
49. Confirm deletion if the existing UI already has confirmation behavior.
50. Do not create an unnecessary new UI.
51. Handle database errors gracefully.
52. Handle offline conditions gracefully.
53. Display meaningful errors.
54. Do not crash if no contacts exist.
55. Display an empty state using the existing design.
56. Preserve the existing application navigation.
57. Now inspect the existing GPS/location implementation.
58. Identify location-related classes.
59. Identify location permissions.
60. Identify existing Google location dependencies.
61. Reuse existing location code if it works.
62. Do not create duplicate location managers.
63. Use Android's recommended location APIs.
64. Request fine location only when required.
65. Request coarse location when appropriate.
66. Request permissions at runtime.
67. Explain why location permission is required if the existing UI supports explanations.
68. Handle permission denied.
69. Handle permanently denied permission.
70. Handle location services disabled.
71. Handle unavailable GPS.
72. Handle network location failure.
73. Do not crash when location is unavailable.
74. Obtain latitude.
75. Obtain longitude.
76. Obtain accuracy.
77. Obtain timestamp.
78. Maintain the latest reliable location.
79. Do not continuously update Firebase every second.
80. Use a reasonable location interval.
81. Use a reasonable minimum distance threshold.
82. Avoid unnecessary battery consumption.
83. Avoid unnecessary Firebase writes.
84. Inspect the existing live-location-sharing UI.
85. Identify the location-sharing toggle or button.
86. Connect the existing control.
87. When location sharing is enabled, start appropriate location updates.
88. When location sharing is disabled, stop unnecessary updates.
89. Store the latest location in Realtime Database.
90. Use users/{uid}/location.
91. Store latitude.
92. Store longitude.
93. Store accuracy.
94. Store timestamp.
95. Store location-sharing status if needed.
96. Do not store an unlimited location history by default.
97. Do not generate huge amounts of unnecessary data.
98. The primary requirement is current/live location.
99. Preserve the existing UI.
100. Update the UI with the current location where appropriate.
101. If a map screen exists, show the user's current location.
102. If a map screen does not exist, do not create a large new map interface in this phase.
103. Prepare location data for later SOS functionality.
104. Prepare location data for caregiver viewing later.
105. Do not implement caregiver accounts yet.
106. Do not implement FCM yet.
107. Use authenticated users for database access.
108. Update Firebase Security Rules.
109. Users should be able to write their own current location.
110. Users should be able to read their own location.
111. Do not expose every user's location publicly.
112. Do not allow unauthenticated location access.
113. Design rules so future authorized caregiver access can be added.
114. Do not make the entire database publicly readable.
115. Handle Firebase permission-denied errors.
116. Handle network errors.
117. Handle database unavailable errors.
118. Avoid blocking the UI while Firebase writes occur.
119. Use asynchronous operations.
120. Ensure location listeners are lifecycle-aware.
121. Avoid memory leaks.
122. Avoid duplicate location callbacks.
123. Stop location updates when the feature is disabled.
124. Stop unnecessary location updates when the application lifecycle requires it.
125. Preserve location updates when required for the existing application behavior.
126. Follow Android background-location requirements.
127. Do not request background location permission unless the actual feature requires it.
128. If background live tracking is required, inspect the existing requirements first.
129. Do not bypass Android permission restrictions.
130. Do not create fake GPS data.
131. Do not hard-code latitude.
132. Do not hard-code longitude.
133. Do not simulate movement.
134. Test using real device/emulator location where possible.
135. Inspect the existing navigation flow.
136. Ensure adding contacts does not break navigation.
137. Ensure location permission dialogs do not break navigation.
138. Ensure login state is respected.
139. Only authenticated users should upload personal location data.
140. On logout, stop user-specific location listeners where appropriate.
141. Do not leave location listeners attached to the previous user.
142. Reload location configuration after login.
143. Persist user preferences only where appropriate.
144. Use Firebase as the persistent backend.
145. Do not use a separate database.
146. Keep code modular.
147. Create a location repository/service if needed.
148. Create an emergency contact repository if needed.
149. Reuse existing project architecture.
150. Do not rewrite unrelated Activities.
151. Build the application.
152. Fix Gradle errors.
153. Fix Java/Kotlin compilation errors.
154. Fix manifest errors.
155. Fix runtime permission errors.
156. Fix Firebase database errors.
157. Test registration with a new user.
158. Test login with an existing user.
159. Test adding an emergency contact.
160. Test reading emergency contacts.
161. Test editing an emergency contact if supported.
162. Test deleting an emergency contact if supported.
163. Test location permission.
164. Test GPS enabled.
165. Test GPS disabled.
166. Test current location retrieval.
167. Test Firebase location write.
168. Test enabling live location.
169. Test disabling live location.
170. Test application restart.
171. Test logout.
172. Verify location listeners are not duplicated.
173. Verify Firebase does not receive excessive writes.
174. Verify database security.
175. Verify another unauthenticated user cannot read private location.
176. Verify existing authentication still works.
177. Verify existing UI remains visually intact.
178. Do not add FCM notification implementation yet.
179. Do not add advanced SOS notification logic yet.
180. Do not add obstacle detection yet.
181. Do not redesign voice navigation yet.
182. Do not redesign Google Maps yet.
183. Prepare the location layer for the next phase.
184. Prepare the SOS layer for the next phase.
185. Prepare emergency contact data for notification delivery.
186. Document any Firebase Console configuration needed.
187. Document any Android permissions added.
188. Document any files changed.
189. Document any unresolved issues.
190. Do not claim testing succeeded if it was not performed.
191. Clearly report compilation status.
192. Clearly report database status.
193. Clearly report authentication status.
194. Clearly report location status.
195. Clearly report emergency-contact status.
196. Clearly report anything requiring manual configuration.
197. Keep all previous working functionality intact.
198. Do not start unrelated improvements.
199. Complete only this phase.
200. Stop after completing this phase and wait for Prompt 3.