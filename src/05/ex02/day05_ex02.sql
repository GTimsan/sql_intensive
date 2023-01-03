CREATE INDEX IF NOT EXISTS idx_person_name ON person USING btree (upper(name));
set enable_seqscan = off;
EXPLAIN ANALYSE
SELECT * FROM person WHERE upper(name) = 'ANNA';