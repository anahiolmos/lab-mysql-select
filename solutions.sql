-- Challenge 1
SELECT author.au_id as Author_ID,
author.au_lname as Last_Name,
author.au_fname as First_Name,
titles.title as Title,
publishers.pub_name as Publisher
FROM publications.authors author
RIGHT JOIN publications.titleauthor titleau ON author.au_id = titleau.au_id
LEFT JOIN publications.titles titles ON titles.title_id = titleau.title_id
LEFT JOIN publications.publishers publishers ON titles.pub_id = publishers.pub_id;

-- Challenge 2
#SELECT @@sql_mode;
#SET 
#sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SELECT author.au_id as Author_ID,
author.au_lname as Last_Name,
author.au_fname as First_Name,
publishers.pub_name as Publisher,
COUNT(titles.title) as Title_Count
FROM publications.authors author
RIGHT JOIN publications.titleauthor titleau ON author.au_id = titleau.au_id
LEFT JOIN publications.titles titles ON titles.title_id = titleau.title_id
LEFT JOIN publications.publishers publishers ON titles.pub_id = publishers.pub_id
GROUP BY Author_ID, Last_Name, First_Name, Publisher
ORDER BY Author_ID DESC, Last_Name, First_Name, Publisher DESC;

-- Challenge 3
SELECT author.au_id as Author_ID,
author.au_lname as Last_Name,
author.au_fname as First_Name,
SUM(titles.ytd_sales) as Total_Titles_Sold
FROM publications.authors author
RIGHT JOIN publications.titleauthor titleau ON author.au_id = titleau.au_id
LEFT JOIN publications.titles titles ON titles.title_id = titleau.title_id
LEFT JOIN publications.sales sales ON sales.title_id = titles.title_id
GROUP BY Author_ID
ORDER BY Total_Titles_Sold DESC
LIMIT 3;

-- Challenge 4
SELECT author.au_id as Author_ID,
author.au_lname as Last_Name,
author.au_fname as First_Name,
COALESCE(SUM(qty), 0) AS Total_Titles_Sold
FROM publications.authors author
RIGHT JOIN publications.titleauthor titleau ON author.au_id = titleau.au_id
LEFT JOIN publications.titles titles ON titles.title_id = titleau.title_id
LEFT JOIN publications.sales sales ON sales.title_id = titles.title_id
GROUP BY Author_ID
ORDER BY Total_Titles_Sold DESC;


