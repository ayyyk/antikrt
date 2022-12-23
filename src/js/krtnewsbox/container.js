import React, { useEffect, useState } from "react";
import axios from 'axios';

//import Skeleton from '@mui/material/Skeleton';

import News from './news.js';

let firstLoad = false;
let i = 0
let source 
let timer = null;

const Container = function() {
	const [newsContent, setNews] = useState([]);
	/*const message_event = function(event) {
		if (i<40){
			i++
			let tmp = Object.assign([], newsContent)
			tmp.unshift({
				'message': event.data,
				'messageId': 1000 + i
			})
			setNews(tmp)
		}
	};
	const error_event = function(event){
		console.log('error!!!!')
	}
*/
	const interval_query = function(){
		//const now = new Date();
		//console.log(now)
		axios
			.get('/lastnews2/')
			.then((responce2)=>{
				const news = responce2.data.news;
				if (news.length){
					//const tmp = Object.assign([], newsContent)
					//const arrnews = [].concat(news, newsContent).slice(0, 10)
					setNews([].concat(news, newsContent).slice(0, 10))
				}
			})
	}

	useEffect(()=>{
		if (!firstLoad){
			//source = new EventSource("lastnews/");
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
		/*else if (!source.onmessage){
			console.log('source.onmessage - ok')
			//source.onmessage = message_event
			//source.onerror = error_event
		}*/
	})

	return (
		<News news={newsContent}/>
		//firstLoad ? <News news={a}/> : (
			/*
			<>
				<Skeleton variant="text" sx={{ fontSize: '1rem' }} />
				<Skeleton variant="circular" width={40} height={40} />
				<Skeleton variant="rectangular" width={210} height={60} />
				<Skeleton variant="rounded" width={210} height={60} />
			</>
			*/
		//) 
	)
}

export default Container