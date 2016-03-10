"use strict"

angular

  .module( "pvdm.services" )

  .factory("formBuilder", () ->    

    form = [

      'Master_no',
      'Resident_identifier',
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

    return form
  )