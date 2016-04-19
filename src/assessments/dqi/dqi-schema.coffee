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

        C4:
          type: 'string'
          title: '(C4) Making Self Understood'
          enum: ['0', '1', '2', '3']
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
          title: '(E4dA) Resists care frequency'
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

        I2h:
          type: 'string'
          title: '(I2h) Septicemia'
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

        J5c:
          type: 'string'
          title: '(J5c) End-stage disease'
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

        O3:
          type: 'string'
          title: '(O3) Injections'
          default: '0'
          required: true
          maxLength: 1
          pattern: REGEX.DAYS
          validationMessage: "Must be between 0-7"

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
        key: 'G1bB'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - No setup or physical help from staff'},
          {value: '1', name: '1 - Setup help only'},
          {value: '2', name: '2 - One person physical assist'},
          {value: '3', name: '3 - Two+ persons physical assist'}
          {value: '8', name: '8 - ADL activity itself did not occur during the entire 7-days'}
      ]}
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
        key: 'H3a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Toileting plan used'},
      ]},
      {
        key: 'H3a'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - None'},
          {value: '1', name: '1 - Bladder retraining program used'},
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
        key: 'I2h'
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
        key: 'J5c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Did not occur'},
          {value: '1', name: '1 - Occurred within the past seven days'},
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
          {value: '0', name: '0 - Yes'},
          {value: '1', name: '1 - No'}
      ]},
      {
        key: 'N1b'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Yes'},
          {value: '1', name: '1 - No'}
      ]},
      {
        key: 'N1c'
        type: 'select'
        titleMap: [
          {value: '', name: '--'},
          {value: '0', name: '0 - Yes'},
          {value: '1', name: '1 - No'}
      ]},
      "O3",
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
      "P7",
      "P8",
      "IAR-1"
    ]
    
    schemaForm.model = {}

    return schemaForm

  )