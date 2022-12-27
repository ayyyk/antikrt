import React, { useEffect, useState } from "react";

const News = function({news}){
	const options = {
		//era: 'long',
		//year: 'numeric',
		month: 'long',
		day: 'numeric',
		//weekday: 'long',
		//timezone: 'UTC',
		hour: 'numeric',
		minute: 'numeric',
		//second: 'numeric'
	};
	return (
		news.map(function(item, index){
			const rightDate = (new Date(item[1])).toLocaleString('ru', options)
			const mes = item[2].length ? item[2]+'... ' : 'Новость на канале'
			return(
				<div key={item[0]} className={"newselem rounded-1"}>
					<div className={"ms-2"}> <b>{rightDate}</b> </div>
					<div className={"ms-2 mt-1"}> 
						<i>{mes}</i> 
						<a href={"https://t.me/channel_anti_krt/" + item[0]} target="_blank">
							(далее в телеграм)
						</a> 
					</div>
				</div>
			)
		})
	)
}

export default News