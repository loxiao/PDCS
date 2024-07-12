USE PDCS;
--插入管理员数据
INSERT INTO admin VALUES ('1', 'Alice', 'admin@1234.com', '1234');
INSERT INTO admin VALUES ('2', 'Bob', 'admin@1213.com', '1211');
--插入竞赛类型数据
INSERT INTO competitiontypes (CompetitionTypeID, TypeName) VALUES (1, '公益类');
INSERT INTO competitiontypes (CompetitionTypeID, TypeName) VALUES (2, '国防类');
INSERT INTO competitiontypes (CompetitionTypeID, TypeName) VALUES (3, '商业类');
--插入评委数据
INSERT INTO judges VALUES ('1 ', 'Jhon','1224.com','1234');
INSERT INTO judges VALUES ('2 ', 'Mike','1432.com','9879');
--插入参与人员数据
INSERT INTO participant VALUES('1','Jim','3415.com','1234','二仙桥','0');
INSERT INTO participant VALUES('2','Kiko','2456.com','1111','成华大道','0');
INSERT INTO participant VALUES('4','朱杨华','1267.com','7890','绍兴','0');
INSERT INTO participant VALUES('5 ','Lili','9868.com','6521','天海市','0');