import * as Popper from "@popperjs/core"
import * as bootstrap from 'bootstrap'

import React from 'react';
import { createRoot } from 'react-dom/client';

import '../css/styles.scss';

import Container from './krtnewsbox/container.js'

window.addEventListener('load', function () {
	
/*	const dropdownElementList = document.querySelectorAll('.dropdown-toggle');
	//const dropdownList = Array.from(dropdownElementList).map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
	console.log(dropdownElementList)
	Array.from(dropdownElementList).map((item)=>{
		item.addEventListener('mouseover', function () {
			console.log(item)
			item.dropdown('toggle')

		})
	})*/


	const home = document.getElementById('homepage')

	if (home){
		const rootElement = document.getElementById('krtnews')
	    const root = createRoot(rootElement);
	    root.render(
            <Container />
	    )
	}
})