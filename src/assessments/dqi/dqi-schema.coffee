"use strict"

angular

  .module( "pvdm.services" )

  .factory("DqiSchema", ($translate, $filter, REGEX) ->

    schemaForm = {}

    schemaForm.schema =
      type: 'object'
      properties:

        Y2:
          type: 'string'
          title: '(Y2) Record Type Name'
          enum: ['CR', 'CI', 'AD', 'UP', 'FA', 'QA', 'MD', 'DC', 'SP']
          default: 'FA'

        Master_no:
          type: 'string'
          title: '(Master_no) Master no. from CCIM'
          default: '1234'
          required: true
          minLength: 4
          maxLength: 4
          pattern: REGEX.NUMERIC
          validationMessage: "Must be 4 digits"

        Resident_identifier:
          type: 'string'
          title: '(Resident_identifier) 10 digit resident identifier'
          default: '1234567890'
          required: true
          minLength: 10
          maxLength: 10
          pattern: REGEX.NUMERIC
          validationMessage: "Must be 10 digits"

        AA7:
          type: 'string'
          title: '(AA7) Admission Type'
          enum: ['01','09']
          default: '01'

        AA8:
          type: 'string'
          title: '(AA8) Reason For Assessment'
          enum: ['01', '02', '03', '04', '05', '10']
          default: '03'

        AA9:
          type: 'string'
          title: '(AA9) Discharge Type'
          enum: ['', '06', '07', '08']
          default: ''

        AB1:
          type: 'string'
          title: '(AB1) Admission/Re-entry date'
          default: $filter('daysAgoFormatted')(10)
          required: true
          minLength: 8
          maxLength: 8
          pattern: REGEX.NUMERIC
          validationMessage: "Format must be yyyymmdd"

        A3:
          type: 'string'
          title: '(A3) Assessment Reference Date'
          default: $filter('daysAgoFormatted')(10)
          required: true
          minLength: 8
          maxLength: 8
          pattern: REGEX.NUMERIC
          validationMessage: "Format must be yyyymmdd"

        B1:
          type: 'string'
          title: '(B1) Comatose'
          enum: ['0', '1']
          default: '0'

        B2a:
          type: 'string'
          title: '(B2a) Short term memory OK'
          enum: ['0', '1']
          default: '0'

        B4:
          type: 'string'
          title: '(B4) Cognitive Skills for Daily Decision Making'
          enum: ['0', '1', '2', '3']
          default: '0'

        C1:
          type: 'string'
          title: '(C1) Hearing'
          enum: ['0', '1', '2', '3']
          default: '0'

        C3b:
          type: 'string'
          title: '(C3b) Writing messages to express needs'
          enum: ['0', '1']
          default: '0'

        C3c:
          type: 'string'
          title: '(C3c) American sign language or Braille'
          enum: ['0', '1']
          default: '0'

        C3d:
          type: 'string'
          title: '(C3d) Signs or gestures or sounds'
          enum: ['0', '1']
          default: '0'

        C3e:
          type: 'string'
          title: '(C3e) Communication board'
          enum: ['0', '1']
          default: '0'

        C3f:
          type: 'string'
          title: '(C3f) Other mode of expression'
          enum: ['0', '1']
          default: '0'

        C4:
          type: 'string'
          title: '(C4) Making Self Understood'
          enum: ['0', '1', '2', '3']
          default: '0'

        C5:
          type: 'string'
          title: '(C5) Speech Clarity'
          enum: ['0', '1', '2']
          default: '0'

        C6:
          type: 'string'
          title: '(C6) Ability to Understand Others'
          enum: ['0', '1', '2', '3']
          default: '0'

        D1:
          type: 'string'
          title: '(D1) Vision'
          enum: ['0', '1', '2', '3', '4']
          default: '0'

        D2a:
          type: 'string'
          title: '(D2a) Side vision problems'
          enum: ['0', '1']
          default: '0'

        D2b:
          type: 'string'
          title: '(D2b) Sees halos, rings, flashes, curtains'
          enum: ['0', '1']
          default: '0'

        D3:
          type: 'string'
          title: '(D3) Visual Appliances'
          enum: ['0', '1']
          default: '0'

        E1a:
          type: 'string'
          title: '(E1a) Negative statements'
          enum: ['0', '1', '2']
          default: '0'

        E1b:
          type: 'string'
          title: '(E1b) Repetitive questions'
          enum: ['0', '1', '2']
          default: '0'

        E1c:
          type: 'string'
          title: '(E1c) Repetitive verbalizations'
          enum: ['0', '1', '2']
          default: '0'

        E1d:
          type: 'string'
          title: '(E1d) Persistent anger with self/others'
          enum: ['0', '1', '2']
          default: '0'

        E1e:
          type: 'string'
          title: '(E1e) Self deprecation'
          enum: ['0', '1', '2']
          default: '0'

        E1f:
          type: 'string'
          title: '(E1f) Expression of unrealistic fears'
          enum: ['0', '1', '2']
          default: '0'

        E1g:
          type: 'string'
          title: '(E1g) Recurrent statements - something terrible'
          enum: ['0', '1', '2']
          default: '0'

        E1h:
          type: 'string'
          title: '(E1h) Repetitive health complaints'
          enum: ['0', '1', '2']
          default: '0'

        E1i:
          type: 'string'
          title: '(E1i) Repetitive anxious complaints'
          enum: ['0', '1', '2']
          default: '0'

        E1j:
          type: 'string'
          title: '(E1j) Unpleasant mood in morning'
          enum: ['0', '1', '2']
          default: '0'

        E1k:
          type: 'string'
          title: '(E1k) Insomnia/change in sleep pattern'
          enum: ['0', '1', '2']
          default: '0'

        E1l:
          type: 'string'
          title: '(E1l) Sad, pained, worried facial expressions'
          enum: ['0', '1', '2']
          default: '0'

        E1m:
          type: 'string'
          title: '(E1m) Crying, tearfulness'
          enum: ['0', '1', '2']
          default: '0'

        E1n:
          type: 'string'
          title: '(E1n) Repetitive physical movements'
          enum: ['0', '1', '2']
          default: '0'

        E1o:
          type: 'string'
          title: '(E1o) Withdrawal from activities of interest'
          enum: ['0', '1', '2']
          default: '0'

        E1p:
          type: 'string'
          title: '(E1p) Reduced social interaction'
          enum: ['0', '1', '2']
          default: '0'

        E2:
          type: 'string'
          title: '(E2) Mood Persistence'
          enum: ['0', '1', '2']
          default: '0'

        E4aA:
          type: 'string'
          title: '(E4aA) Wandering frequency'
          enum: ['0', '1', '2', '3']
          default: '0'

        E4bA:
          type: 'string'
          title: '(E4bA) Verbally abusive frequency'
          enum: ['0', '1', '2', '3']
          default: '0'

        E4cA:
          type: 'string'
          title: '(E4cA) Physically abusive frequency'
          enum: ['0', '1', '2', '3']
          default: '0'

        E4dA:
          type: 'string'
          title: '(E4dA) Inappropriate disruptive frequency'
          enum: ['0', '1', '2', '3']
          default: '0'

        E4eA:
          type: 'string'
          title: '(E4eA) Resists care frequency'
          enum: ['0', '1', '2', '3']
          default: '0'

        G1aA:
          type: 'string'
          title: '(G1aA) Bed mobility self performance'
          enum: ['0', '1', '2', '3', '4', '8']
          default: '0'

        G1aB:
          type: 'string'
          title: '(G1aB) Bed mobility support provided'
          enum: ['0', '1', '2', '3', '8']
          default: '0'

        G1bA:
          type: 'string'
          title: '(G1bA) Transfer self performance'
          enum: ['0', '1', '2', '3', '4', '8']
          default: '0'

        G1bB:
          type: 'string'
          title: '(G1bB) Transfer support provided'
          enum: ['0', '1', '2', '3', '8']
          default: '0'

        G1eA:
          type: 'string'
          title: '(G1eA) Locomotion on unit self performance'
          enum: ['0', '1', '2', '3', '4', '8']
          default: '0'

        G1gA:
          type: 'string'
          title: '(G1gA) Dressing self performance'
          enum: ['0', '1', '2', '3', '4', '8']
          default: '0'

        G1hA:
          type: 'string'
          title: '(G1hA) Eating self performance'
          enum: ['0', '1', '2', '3', '4', '8']
          default: '0'

        G1iA:
          type: 'string'
          title: '(G1iA) Toilet use self performance'
          enum: ['0', '1', '2', '3', '4', '8']
          default: '0'

        G4aA:
          type: 'string'
          title: '(G4aA) Neck range of motion'
          enum: ['0', '1', '2']
          default: '0'

        G4bA:
          type: 'string'
          title: '(G4bA) Arm range of motion'
          enum: ['0', '1', '2']
          default: '0'

        G4cA:
          type: 'string'
          title: '(G4cA) Hand range of motion'
          enum: ['0', '1', '2']
          default: '0'

        G4dA:
          type: 'string'
          title: '(G4dA) Leg range of motion'
          enum: ['0', '1', '2']
          default: '0'

        G4eA:
          type: 'string'
          title: '(G4eA) Foot range of motion'
          enum: ['0', '1', '2']
          default: '0'

        G4fA:
          type: 'string'
          title: '(G4fA) Other limitation/loss range of motion'
          enum: ['0', '1', '2']
          default: '0'

        H1a:
          type: 'string'
          title: '(H1a) Bowel Continence'
          enum: ['0', '1', '2', '3', '4']
          default: '0'

        H1b:
          type: 'string'
          title: '(H1b) Bladder Continence'
          enum: ['0', '1', '2', '3', '4']
          default: '0'

        H2d:
          type: 'string'
          title: '(H2d) Fecal impaction'
          enum: ['0', '1']
          default: '0'

        H3a:
          type: 'string'
          title: '(H3a) Any scheduled toileting plan'
          enum: ['0', '1']
          default: '0'

        H3b:
          type: 'string'
          title: '(H3b) Bladder retraining program'
          enum: ['0', '1']
          default: '0'

        H3d:
          type: 'string'
          title: '(H3d) Indwelling catheter'
          enum: ['0', '1']
          default: '0'

        H3i:
          type: 'string'
          title: '(H3i) Ostomy present'
          enum: ['0', '1']
          default: '0'

        I1a:
          type: 'string'
          title: '(I1a) Diabetes mellitus'
          enum: ['0', '1']
          default: '0'

        I1s:
          type: 'string'
          title: '(I1s) Aphasia'
          enum: ['0', '1']
          default: '0'

        I1t:
          type: 'string'
          title: '(I1t) Cerebral palsy'
          enum: ['0', '1']
          default: '0'

        I1w:
          type: 'string'
          title: '(I1w) Hemiplegia/hemiparesis'
          enum: ['0', '1']
          default: '0'

        I1y:
          type: 'string'
          title: '(I1y) Multiple sclerosis'
          enum: ['0', '1']
          default: '0'

        I1bb:
          type: 'string'
          title: '(I1bb) Quadriplegia'
          enum: ['0', '1']
          default: '0'

        I2f:
          type: 'string'
          title: '(I2f) Pneumonia'
          enum: ['0', '1']
          default: '0'

        I2g:
          type: 'string'
          title: '(I2g) Respiratory infection'
          enum: ['0', '1']
          default: '0'

        I2h:
          type: 'string'
          title: '(I2h) Septicemia'
          enum: ['0', '1']
          default: '0'

        I2k:
          type: 'string'
          title: '(I2k) Urinary tract infection'
          enum: ['0', '1']
          default: '0'

        J1c:
          type: 'string'
          title: '(J1c) Dehydrated'
          enum: ['0', '1']
          default: '0'

        J1e:
          type: 'string'
          title: '(J1e) Delusions'
          enum: ['0', '1']
          default: '0'

        J1h:
          type: 'string'
          title: '(J1h) Fever'
          enum: ['0', '1']
          default: '0'

        J1i:
          type: 'string'
          title: '(J1i) Hallucinations'
          enum: ['0', '1']
          default: '0'

        J1j:
          type: 'string'
          title: '(J1j) Internal bleeding'
          enum: ['0', '1']
          default: '0'

        J1o:
          type: 'string'
          title: '(J1o) Vomiting'
          enum: ['0', '1']
          default: '0'

        J2A:
          type: 'string'
          title: '(J2A) Pain symptoms - Frequency'
          enum: ['0', '1', '2']
          default: '0'

        J2B:
          type: 'string'
          title: '(J2B) Pain Symptoms - Intensity'
          enum: ['1', '2', '3']
          default: ''

        J4A:
          type: 'string'
          title: '(J4A) Fell in past 30 days'
          enum: ['0', '1']
          default: ''

        J4C:
          type: 'string'
          title: '(J4C) Hip fracture in last 180 days'
          enum: ['0', '1']
          default: ''

        J4D:
          type: 'string'
          title: '(J4D) Other fracture in last 180 days'
          enum: ['0', '1']
          default: ''

        J5c:
          type: 'string'
          title: '(J5c) End-stage disease'
          enum: ['0', '1']
          default: '0'

        K3a:
          type: 'string'
          title: '(K3a) Weight loss'
          enum: ['0', '1', '9']
          default: '0'

        K4c:
          type: 'string'
          title: '(K4c) Leaves 25% + food uneaten at most meals'
          enum: ['0', '1']
          default: '0'

        K5a:
          type: 'string'
          title: '(K5a) Parenteral/IV'
          enum: ['0', '1']
          default: '0'

        K5b:
          type: 'string'
          title: '(K5b) Feeding tube'
          enum: ['0', '1']
          default: '0'

        K5h:
          type: 'string'
          title: '(K5h) On a planned weight change program'
          enum: ['0', '1']
          default: '0'

        K6a:
          type: 'string'
          title: '(K6a) Parenteral/Enteral Intake - total calories'
          enum: ['0', '1', '2', '3', '4']
          default: '0'

        K6b:
          type: 'string'
          title: '(K6b) Parenteral/Enteral Intake - average intake'
          enum: ['0', '1', '2', '3', '4', '5']
          default: '0'

        L1c:
          type: 'string'
          title: '(L1c) Some or all natural teeth lost'
          enum: ['0', '1']
          default: '0'

        L1d:
          type: 'string'
          title: '(L1d) Broken, loose, or carious teeth'
          enum: ['0', '1']
          default: '0'

        L1e:
          type: 'string'
          title: '(L1e) Inflamed gums, oral abscesses, etc.'
          enum: ['0', '1']
          default: '0'

        M1a:
          type: 'string'
          title: '(M1a) Number of Stage 1 Ulcers'
          enum: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
          default: '0'

        M1b:
          type: 'string'
          title: '(M1b) Number of Stage 2 Ulcers'
          enum: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
          default: '0'

        M1c:
          type: 'string'
          title: '(M1c) Number of Stage 3 Ulcers'
          enum: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
          default: '0'

        M1d:
          type: 'string'
          title: '(M1d) Number of Stage 4 Ulcers'
          enum: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
          default: '0'

        M2a:
          type: 'string'
          title: '(M2a) Stage of pressure ulcer'
          enum: ['0', '1', '2', '3', '4']
          default: '0'

        M3:
          type: 'string'
          title: '(M3) History of Resolved/Cured Ulcers'
          enum: ['0', '1']
          default: '0'

        M4b:
          type: 'string'
          title: '(M2a) Burns (second or third degree)'
          enum: ['0', '1']
          default: '0'

        M4c:
          type: 'string'
          title: '(M2c) Open lesions other than ulcers, rashes, cuts'
          enum: ['0', '1']
          default: '0'

        M4g:
          type: 'string'
          title: '(M2g) Surgical wounds'
          enum: ['0', '1']
          default: '0'

        M5a:
          type: 'string'
          title: '(M5a) Pressure relieving device(s) for chair'
          enum: ['0', '1']
          default: '0'

        M5b:
          type: 'string'
          title: '(M5b) Pressure relieving device(s) for bed'
          enum: ['0', '1']
          default: '0'

        M5c:
          type: 'string'
          title: '(M5c) Turning or repositioning program'
          enum: ['0', '1']
          default: '0'

        M5d:
          type: 'string'
          title: '(M5d) Nutrition/hydration intervention'
          enum: ['0', '1']
          default: '0'

        M5e:
          type: 'string'
          title: '(M5e) Ulcer care'
          enum: ['0', '1']
          default: '0'

        M5f:
          type: 'string'
          title: '(M5f) Surgical wound care'
          enum: ['0', '1']
          default: '0'

        M5g:
          type: 'string'
          title: '(M5g) Application of dressings except to feet'
          enum: ['0', '1']
          default: '0'

        M5h:
          type: 'string'
          title: '(M5h) Ointments/medications except to feet'
          enum: ['0', '1']
          default: '0'

        M6b:
          type: 'string'
          title: '(M6b) Infection of the foot'
          enum: ['0', '1']
          default: '0'

        M6c:
          type: 'string'
          title: '(M6c) Open lesions on the foot'
          enum: ['0', '1']
          default: '0'

        M6f:
          type: 'string'
          title: '(M6f) Application of dressings to foot'
          enum: ['0', '1']
          default: '0'

        N1a:
          type: 'string'
          title: '(N1a) Time Awake - Morning'
          enum: ['0', '1']
          default: '0'

        N1b:
          type: 'string'
          title: '(N1b) Time Awake - Afternoon'
          enum: ['0', '1']
          default: '0'

        N1c:
          type: 'string'
          title: '(N1c) Time Awake - Evening'
          enum: ['0', '1']
          default: '0'

        N2:
          type: 'string'
          title: '(N2) Average Time Involved in Activities'
          enum: ['0', '1', '2', '3'] 
          default: '0'

        O3:
          type: 'string'
          title: '(O3) Injections'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        O4b:
          type: 'string'
          title: '(O4b) Days received Antianxiety'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        O4c:
          type: 'string'
          title: '(O4c) Days received Antidepressant'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        O4d:
          type: 'string'
          title: '(O4d) Days received Hypnotic'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P1aO:
          type: 'string'
          title: '(P1aO) Hospice care'
          enum: ['0', '1']
          default: '0'

        P1baA:
          type: 'string'
          title: '(P1baA) Speech therapy - Days'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P1baB:
          type: 'string'
          title: '(P1baB) Speech therapy - Minutes'
          default: '0'
          required: true
          maxLength: 4
          validationMessage: "Must be between 0-9999"

        P1bbA:
          type: 'string'
          title: '(P1bbA) Occupational therapy - Days'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P1bbB:
          type: 'string'
          title: '(P1bbB) Occupational therapy - Minutes'
          default: '0'
          required: true
          maxLength: 4
          validationMessage: "Must be between 0-9999"

        P1bcA:
          type: 'string'
          title: '(P1bcA) Physical therapy - Days'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P1bcB:
          type: 'string'
          title: '(P1bcB) Physical therapy - Minutes'
          default: '0'
          required: true
          maxLength: 4
          validationMessage: "Must be between 0-9999"

        P1bdA:
          type: 'string'
          title: '(P1bdA) Respiratory therapy - Days'
          default: '0'
          required: true
          maxLength: 4
          validationMessage: "Must be between 0-9999"

        P3a:
          type: 'string'
          title: '(P3a) Nursing rehab - Range of motion (passive)'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3b:
          type: 'string'
          title: '(P3b) Nursing rehab - Range of motion (active)'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3c:
          type: 'string'
          title: '(P3c) Nursing rehab - Splint or brace assistance'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3d:
          type: 'string'
          title: '(P3d) Nursing rehab - Bed mobility'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3e:
          type: 'string'
          title: '(P3e) Nursing rehab - Transfer'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3f:
          type: 'string'
          title: '(P3f) Nursing rehab - Walking'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3g:
          type: 'string'
          title: '(P3g) Nursing rehab - Dressing or grooming'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3h:
          type: 'string'
          title: '(P3h) Nursing rehab - Eating or swallowing'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3i:
          type: 'string'
          title: '(P3i) Nursing rehab - Amputation or prosthesis care'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P3j:
          type: 'string'
          title: '(P3j) Nursing rehab - Communication'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

        P4c:
          type: 'string'
          title: '(P4c) Trunk restraint'
          enum: ['0', '1', '2']
          default: '0'

        P4d:
          type: 'string'
          title: '(P4d) Limb restraint'
          enum: ['0', '1', '2']
          default: '0'

        P4e:
          type: 'string'
          title: '(P4e) Limb restraint'
          enum: ['0', '1', '2']
          default: '0'

        P7:
          type: 'string'
          title: '(P7) Physician Visits'
          default: '0'
          maxLength: 2
          pattern: REGEX.VISITS
          validationMessage: "Must be between 0-14"

        P8:
          type: 'string'
          title: '(P8) Physician Orders'
          default: '0'
          required: true
          maxLength: 2
          pattern: REGEX.VISITS
          validationMessage: "Must be between 0-14"

        R3a:
          type: 'string'
          title: '(R3a) Discharge To Facility/Level Of Care'
          enum: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'] 
          default: '0'

        "IAR-1":
          type: 'string'
          title: '(IAR-1) Verision'
          default: '2013'
          required: true
          minLength: 0
          maxLength: 4
          pattern: REGEX.NUMERIC
          validationMessage: "Format must be yyyy"

    schemaForm.form = [
      {
        key: 'Y2',
        type: 'select',
        titleMap: [
          {value: 'CR', name: 'CR - Control Record'},
          {value: 'CI', name: 'CI - Contact Information'},
          {value: 'AD', name: 'AD - Admission/Re-entry'},
          {value: 'UP', name: 'UP - Update'},
          {value: 'FA', name: 'FA - RAI MDS 2.0 Full Assessment'},
          {value: 'QA', name: 'QA - RAI MDS 2.0 Quarterly Assessment'},
          {value: 'MD', name: 'MD - Medication'},
          {value: 'DC', name: 'DC - Discharge'},
          {value: 'SP', name: 'SP - Special Project'}
        ]},
      "Master_no",
      "Resident_identifier",
      {
        key: 'AA7'
        type: 'select'
        titleMap: [
          {value: '01', name: '01 - Admission'},
          {value: '09', name: '09 - Re-Entry'}
      ]},
      {
        key: 'AA8'
        type: 'select'
        titleMap: [
          {value: '01', name: '01 - Admission'},
          {value: '02', name: '02 - Annual'},
          {value: '03', name: '03 - Significant Change in Status'},
          {value: '04', name: '04 - Significant Change of Prior Full Assessment'},
          {value: '05', name: '05 - Quarterly Review Assessment'},
          {value: '10', name: '10 - Significant Change of Prior Quarterly Assessment'}
      ]},
      {
        key: 'AA9'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '06', name: '06 - Discharge—Return Not Anticipated'},
          {value: '07', name: '07 - Discharge—Return Anticipated'},
          {value: '08', name: '08 - Discharged Prior to Completing Initial Assessment'}
      ]},
      'AB1',
      'A3',
      {
        key: 'B1'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Not comatose or semi-comatose'},
          {value: '1', name: '1 - Comatose or in a persistent vegetative state'}
      ]},
      {
        key: 'B2a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No memory problem'},
          {value: '1', name: '1 - Memory problem'}
      ]},
      {
        key: 'B4'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Independent'},
          {value: '1', name: '1 - Modified Independence'},
          {value: '2', name: '2 - Moderately Impaired'},
          {value: '3', name: '3 - Severely Impaired'}
      ]},
      {
        key: 'C1'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Hears adequately'},
          {value: '1', name: '1 - Minimal difficulty'},
          {value: '2', name: '2 - Hears in special situations only'},
          {value: '3', name: '3 - Highly impaired'}
      ]},
      {
        key: 'C3b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'C3c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'C3d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'C3e'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'C3f'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'C4'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Understood'},
          {value: '1', name: '1 - Usually Understood'},
          {value: '2', name: '2 - Sometimes Understood'},
          {value: '3', name: '3 - Rarely or Never Understood'}
      ]},
      {
        key: 'C5'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No change'},
          {value: '1', name: '1 - Improved'},
          {value: '2', name: '2 - Deteriorated'}
      ]},
      {
        key: 'C6'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Understands'},
          {value: '1', name: '1 - Usually understands'},
          {value: '2', name: '2 - Sometimes understands'},
          {value: '3', name: '3 - Rarely or never understands'}
      ]},
      {
        key: 'D1'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Understands'},
          {value: '1', name: '1 - Usually understands'},
          {value: '2', name: '2 - Sometimes understands'},
          {value: '3', name: '3 - Rarely or never understands'}
      ]},
      {
        key: 'D2a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'D2b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'D3'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'E1a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1e'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1f'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1g'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1h'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1i'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1j'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1k'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1l'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1m'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1n'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1o'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E1p'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Indicator not exhibited in last 30 days'},
          {value: '1', name: '1 - Indicator of this type exhibited up to five days a week'},
          {value: '2', name: '2 - Indicator of this type exhibited daily or almost daily'}
      ]},
      {
        key: 'E2'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No mood indicators'},
          {value: '1', name: '1 - Indicators present, easily altered'},
          {value: '2', name: '2 - Indicators present, not easily altered'}
      ]},
      {
        key: 'E4aA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Behavioural symptom was not exhibited in last seven days'},
          {value: '1', name: '1 - Behavioural symptom occurred 1 to 3 days, in last 7 days'},
          {value: '2', name: '2 - Behavioural symptom occurred 4 to 6 days, but less than daily'},
          {value: '3', name: '3 - Behavioural symptom occurred daily or more frequently'}
      ]},
      {
        key: 'E4bA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Behavioural symptom was not exhibited in last seven days'},
          {value: '1', name: '1 - Behavioural symptom occurred 1 to 3 days, in last 7 days'},
          {value: '2', name: '2 - Behavioural symptom occurred 4 to 6 days, but less than daily'},
          {value: '3', name: '3 - Behavioural symptom occurred daily or more frequently'}
      ]},
      {
        key: 'E4cA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Behavioural symptom was not exhibited in last seven days'},
          {value: '1', name: '1 - Behavioural symptom occurred 1 to 3 days, in last 7 days'},
          {value: '2', name: '2 - Behavioural symptom occurred 4 to 6 days, but less than daily'},
          {value: '3', name: '3 - Behavioural symptom occurred daily or more frequently'}
      ]},
      {
        key: 'E4dA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Behavioural symptom was not exhibited in last seven days'},
          {value: '1', name: '1 - Behavioural symptom occurred 1 to 3 days, in last 7 days'},
          {value: '2', name: '2 - Behavioural symptom occurred 4 to 6 days, but less than daily'},
          {value: '3', name: '3 - Behavioural symptom occurred daily or more frequently'}
      ]},
      {
        key: 'E4eA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Behavioural symptom was not exhibited in last seven days'},
          {value: '1', name: '1 - Behavioural symptom occurred 1 to 3 days, in last 7 days'},
          {value: '2', name: '2 - Behavioural symptom occurred 4 to 6 days, but less than daily'},
          {value: '3', name: '3 - Behavioural symptom occurred daily or more frequently'}
      ]},
      {
        key: 'G1aA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Independent'},
          {value: '1', name: '1 - Supervision'},
          {value: '2', name: '2 - Limited Assistance'},
          {value: '3', name: '3 - Extensive Assistance'},
          {value: '4', name: '4 - Total Dependence'},
          {value: '8', name: '8 - Activity did not occur during the entire 7-day period'}
      ]},
      {
        key: 'G1bA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Independent'},
          {value: '1', name: '1 - Supervision'},
          {value: '2', name: '2 - Limited Assistance'},
          {value: '3', name: '3 - Extensive Assistance'},
          {value: '4', name: '4 - Total Dependence'},
          {value: '8', name: '8 - Activity did not occur during the entire 7-day period'}
      ]},
      {
        key: 'G1bB'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No setup or physical help from staff'},
          {value: '1', name: '1 - Setup help only'},
          {value: '2', name: '2 - One person physical assist'},
          {value: '3', name: '3 - Two+ persons physical assist'}
          {value: '8', name: '8 - ADL activity itself did not occur during the entire 7-days'}
      ]},
      {
        key: 'G1eA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Independent'},
          {value: '1', name: '1 - Supervision'},
          {value: '2', name: '2 - Limited Assistance'},
          {value: '3', name: '3 - Extensive Assistance'},
          {value: '4', name: '4 - Total Dependence'},
          {value: '8', name: '8 - Activity did not occur during the entire 7-day period'}
      ]},
      {
        key: 'G1gA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Independent'},
          {value: '1', name: '1 - Supervision'},
          {value: '2', name: '2 - Limited Assistance'},
          {value: '3', name: '3 - Extensive Assistance'},
          {value: '4', name: '4 - Total Dependence'},
          {value: '8', name: '8 - Activity did not occur during the entire 7-day period'}
      ]},
      {
        key: 'G1hA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Independent'},
          {value: '1', name: '1 - Supervision'},
          {value: '2', name: '2 - Limited Assistance'},
          {value: '3', name: '3 - Extensive Assistance'},
          {value: '4', name: '4 - Total Dependence'},
          {value: '8', name: '8 - Activity did not occur during the entire 7-day period'}
      ]},
      {
        key: 'G1iA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Independent'},
          {value: '1', name: '1 - Supervision'},
          {value: '2', name: '2 - Limited Assistance'},
          {value: '3', name: '3 - Extensive Assistance'},
          {value: '4', name: '4 - Total Dependence'},
          {value: '8', name: '8 - Activity did not occur during the entire 7-day period'}
      ]},
      {
        key: 'G4aA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No limitation'},
          {value: '1', name: '1 - Limitation on 1 side'},
          {value: '2', name: '2 - Limitation on both sides'}
      ]},
      {
        key: 'G4bA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No limitation'},
          {value: '1', name: '1 - Limitation on 1 side'},
          {value: '2', name: '2 - Limitation on both sides'}
      ]},
      {
        key: 'G4cA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No limitation'},
          {value: '1', name: '1 - Limitation on 1 side'},
          {value: '2', name: '2 - Limitation on both sides'}
      ]},
      {
        key: 'G4dA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No limitation'},
          {value: '1', name: '1 - Limitation on 1 side'},
          {value: '2', name: '2 - Limitation on both sides'}
      ]},
      {
        key: 'G4eA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No limitation'},
          {value: '1', name: '1 - Limitation on 1 side'},
          {value: '2', name: '2 - Limitation on both sides'}
      ]},
      {
        key: 'G4fA'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No limitation'},
          {value: '1', name: '1 - Limitation on 1 side'},
          {value: '2', name: '2 - Limitation on both sides'}
      ]},
      {
        key: 'H1a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Continent'},
          {value: '1', name: '1 - Usually continent'},
          {value: '2', name: '2 - Occasionally incontinent'},
          {value: '3', name: '3 - Frequently incontinent'},
          {value: '4', name: '4 - Incontinent'}
      ]},
      {
        key: 'H1b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Continent'},
          {value: '1', name: '1 - Usually continent'},
          {value: '2', name: '2 - Occasionally incontinent'},
          {value: '3', name: '3 - Frequently incontinent'},
          {value: '4', name: '4 - Incontinent'}
      ]},
      {
        key: 'H2d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'H3a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Toileting plan used'},
      ]},
      {
        key: 'H3b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Bladder retraining program used'},
      ]},
      {
        key: 'H3d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'H3i'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I1a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I1s'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I1t'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I1w'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I1y'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I1bb'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I2f'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I2g'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I2h'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'I2k'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'J1c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
      ]},
      {
        key: 'J1e'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
      ]},
      {
        key: 'J1h'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
      ]},
      {
        key: 'J1i'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
      ]},
      {
        key: 'J1j'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
      ]},
      {
        key: 'J1o'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
      ]},
      {
        key: 'J2A'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No pain'},
          {value: '1', name: '1 - Pain less than daily'},
          {value: '2', name: '2 - Pain daily'}
      ]},
      {
        key: 'J2B'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '1', name: '1 - Mild pain'},
          {value: '2', name: '2 - Moderate pain'},
          {value: '3', name: '3 - Times when pain is horrible or excruciating'}
      ]},
      {
        key: 'J4A'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Yes'},
          {value: '1', name: '1 - No'}
      ]},
      {
        key: 'J4C'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Yes'},
          {value: '1', name: '1 - No'}
      ]},
      {
        key: 'J4D'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Yes'},
          {value: '1', name: '1 - No'}
      ]},
      {
        key: 'J5c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
      ]},
      {
        key: 'K3a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
          {value: '9', name: '9 - Unknown (admission only)'}
      ]},
      {
        key: 'K5a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'K5b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'K5h'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'K6a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - 1% to 25%'},
          {value: '2', name: '2 - 26% to 50%'},
          {value: '3', name: '3 - 51% to 75%'},
          {value: '4', name: '4 - 76% to 100%'},
      ]},
      {
        key: 'K6b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - 1 to 500 cc/day'},
          {value: '2', name: '2 - 501 to 1000 cc/day'},
          {value: '3', name: '3 - 1001 to 1500 cc/day'},
          {value: '4', name: '4 - 1501 to 2000 cc/day'},
          {value: '5', name: '5 -2001 to or more cc/day'}
      ]},
      {
        key: 'L1c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'L1d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'L1e'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'M1a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - 1 ulcer'},
          {value: '2', name: '2 - 2 ulcers'},
          {value: '3', name: '3 - 3 ulcers'},
          {value: '4', name: '4 - 4 ulcers'},
          {value: '5', name: '5 - 5 ulcers'},
          {value: '6', name: '6 - 6 ulcers'},
          {value: '7', name: '7 - 7 ulcers'},
          {value: '8', name: '8 - 8 ulcers'},
          {value: '9', name: '9 - 9 or more ulcers'}
      ]},
      {
        key: 'M1b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - 1 ulcer'},
          {value: '2', name: '2 - 2 ulcers'},
          {value: '3', name: '3 - 3 ulcers'},
          {value: '4', name: '4 - 4 ulcers'},
          {value: '5', name: '5 - 5 ulcers'},
          {value: '6', name: '6 - 6 ulcers'},
          {value: '7', name: '7 - 7 ulcers'},
          {value: '8', name: '8 - 8 ulcers'},
          {value: '9', name: '9 - 9 or more ulcers'}
      ]},
      {
        key: 'M1c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - 1 ulcer'},
          {value: '2', name: '2 - 2 ulcers'},
          {value: '3', name: '3 - 3 ulcers'},
          {value: '4', name: '4 - 4 ulcers'},
          {value: '5', name: '5 - 5 ulcers'},
          {value: '6', name: '6 - 6 ulcers'},
          {value: '7', name: '7 - 7 ulcers'},
          {value: '8', name: '8 - 8 ulcers'},
          {value: '9', name: '9 - 9 or more ulcers'}
      ]},
      {
        key: 'M1d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - 1 ulcer'},
          {value: '2', name: '2 - 2 ulcers'},
          {value: '3', name: '3 - 3 ulcers'},
          {value: '4', name: '4 - 4 ulcers'},
          {value: '5', name: '5 - 5 ulcers'},
          {value: '6', name: '6 - 6 ulcers'},
          {value: '7', name: '7 - 7 ulcers'},
          {value: '8', name: '8 - 8 ulcers'},
          {value: '9', name: '9 - 9 or more ulcers'}
      ]},
      {
        key: 'M2a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Stage 1'},
          {value: '2', name: '2 - Stage 2'},
          {value: '3', name: '3 - Stage 3'},
          {value: '4', name: '4 - Stage 4'}
      ]},
      {
        key: 'M3'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'},
      ]},
      {
        key: 'M4b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M4c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M4g'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5e'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5f'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5g'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M5h'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M6b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M6c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'M6f'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Evidence of such problems in the last seven days'}
      ]},
      {
        key: 'N1a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'N1b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'N1c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      {
        key: 'N2'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Most - more than 2/3 of time'},
          {value: '1', name: '1 - Some - from 1/3 to 2/3 of time'},
          {value: '2', name: '2 - Little - less than 1/3 of time'},
          {value: '3', name: '3 - None'}
      ]},
      "O3",
      "O4b",
      "O4c",
      "O4d",
      {
        key: 'P1aO'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No'},
          {value: '1', name: '1 - Yes'}
      ]},
      "P1baA",
      "P1baB",
      "P1bbA",
      "P1bbB",
      "P1bcA",
      "P1bcB",
      "P1bdA",
      "P3a",
      "P3b",
      "P3c",
      "P3d",
      "P3e",
      "P3f",
      "P3g",
      "P3h",
      "P3i",
      "P3j",
      {
        key: 'P4c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Not used'},
          {value: '1', name: '1 - Used less than daily'},
          {value: '2', name: '2 - Used daily'}
      ]},
      {
        key: 'P4d'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Not used'},
          {value: '1', name: '1 - Used less than daily'},
          {value: '2', name: '2 - Used daily'}
      ]},
      {
        key: 'P4e'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Not used'},
          {value: '1', name: '1 - Used less than daily'},
          {value: '2', name: '2 - Used daily'}
      ]},
      "P7",
      "P8",
      {
        key: 'R3a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Ambulatory Health Service'},
          {value: '1', name: '1 - Inpatient Acute Care Service'},
          {value: '2', name: '2 - Inpatient Rehabilitation Service (General)'}
          {value: '3', name: '3 - Inpatient Continuing Care Service'},
          {value: '4', name: '4 - Residential Care Service (24-hour nursing care)'},
          {value: '5', name: '5 - Inpatient Psychiatry Service'}
          {value: '6', name: '6 - Other/Unclassified Service'},
          {value: '7', name: '7 - Inpatient Rehabilitation Service (Specialized)'},
          {value: '8', name: '8 - Home Care Service'}
          {value: '9', name: '9 - Residential Care Service (board and care)'},
          {value: '10', name: '10 - Private Home (no home care)'},
          {value: '11', name: '11 - Deceased'}
      ]},
      "IAR-1"
    ]
    
    schemaForm.model = {}

    return schemaForm

  )