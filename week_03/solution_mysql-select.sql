-- Challenge 1
SELECT a.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM authors AS a
	JOIN titleauthor AS ta
		ON a.au_id = ta.au_id
	JOIN titles AS t
		ON t.title_id = ta.title_id
	JOIN publishers AS p
		ON t.pub_id = p.pub_id
;

-- Challenge 2
-- We Group By publisher and author and count the titles.
SELECT a.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', 
	   pub_name AS 'PUBLISHER', COUNT(t.title_id) AS 'TITLE COUNT'
FROM authors AS a
	JOIN titleauthor AS ta
		ON a.au_id = ta.au_id
	JOIN titles AS t
		ON t.title_id = ta.title_id
	JOIN publishers AS p
		ON t.pub_id = p.pub_id
GROUP BY p.pub_id, a.au_id
;

-- Challenge 3
SELECT a.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', SUM(qty) AS 'TOTAL'
FROM authors AS a
	JOIN titleauthor AS ta
		ON a.au_id = ta.au_id
	JOIN titles AS t
		ON t.title_id = ta.title_id
	JOIN sales AS s
		ON s.title_id=t.title_id
GROUP BY a.au_id
ORDER BY `TOTAL` DESC
LIMIT 3;

-- Challenge 4
SELECT a.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', IFNULL(SUM(qty),0) AS 'TOTAL'
--  alternatively: COALESCE(SUM(qty),0) AS 'TOTAL' 
FROM authors AS a
-- We must use LEFT joins in order to keep the authors that have no published titles.
	LEFT JOIN titleauthor AS ta
		ON a.au_id = ta.au_id
	LEFT JOIN titles AS t
		ON t.title_id = ta.title_id
	LEFT JOIN sales AS s
		ON s.title_id=t.title_id
GROUP BY a.au_id
ORDER BY `TOTAL` DESC
;

-- Challenge 4, yet another way
-- doc link
SELECT a.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME',
CASE WHEN ISNULL(SUM(qty)) THEN 0
	 ELSE SUM(qty)
END
AS 'TOTAL'
FROM authors AS a
	LEFT JOIN titleauthor AS ta
		ON a.au_id = ta.au_id
	LEFT JOIN titles AS t
		ON t.title_id = ta.title_id
	LEFT JOIN sales AS s
		ON s.title_id=t.title_id
GROUP BY a.au_id
ORDER BY `TOTAL` DESC
;