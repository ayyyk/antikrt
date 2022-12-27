import React, { useEffect, useState } from "react";
import axios from 'axios';

import News from './news.js';

let firstLoad = null;
let timer = null;

const Container = function() {
	const [newsContent, setNews] = useState([]);
	const interval_query = function(){
		axios
			.get('/lastnews2/')
			.then((responce2)=>{
				const news = responce2.data.news;
				if (news.length){
					const arrnews = [].concat(news, newsContent).slice(0, 5)
					setNews(arrnews)
				}
			})
	}

	useEffect(()=>{
		if (!firstLoad){
			axios
				.get('/allnews/')
				.then((responce)=>{
					const allnews = responce.data.news;
					firstLoad = true;
					setNews(allnews)
				})
		} else {
			if (!timer)
				timer = setInterval(interval_query, 60000);
		}
	})

	return (
		<News news={newsContent}/>
	)
}

export default Container