-- insert
INSERT INTO `events_schema`.`event_types` (`id_event_type`, `title`) VALUES ('13', 'COOKIES');


-- delete
DELETE FROM `events_schema`.`event_types` WHERE (`id_event_type` = '13');


-- join
select * 
from events
join event_types using (id_event_type)
where event_types.title='meeting';


-- select subquery
select * from events
where
id_event_type in (
	select id_event_type from event_types
    where event_types.title in ('meeting', 'battle')
);


-- where with 3 tables
select *
from events, events_participants, participants
where events.id_event=events_participants.id_event and events_participants.id_participant=participants.id_participant;


-- results aggregation
select avg(participant_count)
from
(
	select title, count(id_participant) as participant_count
	from events left join events_participants using (id_event)
	group by id_event
) as table1;


-- hw query
select * from events
join events_participants using (id_event)
where (id_participant = 5) and (start_date > '2010-01-01') and (end_date < '2012-01-01');
