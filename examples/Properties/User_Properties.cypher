//User Properties
MATCH (u:User) WITH DISTINCT keys(u) AS keys
UNWIND keys AS keyslisting WITH DISTINCT keyslisting AS allfields
RETURN allfields;