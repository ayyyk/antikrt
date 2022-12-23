import React, { useEffect, useState } from "react";

const News = function({news}){
	let options = {
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
			let rightDate = (new Date(item.message_date)).toLocaleString('ru', options)
			return(
				<div key={item.messageId} className={"newselem rounded-1"}>
					<div> <b>{rightDate}</b> </div>
					<div className={"ms-4 mt-1"}> <i>{item.message}</i> </div>
				</div>
			)
		})
	)
}

export default News