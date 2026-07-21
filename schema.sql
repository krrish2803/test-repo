

-- BREAKING: Drop user_id column
ALTER TABLE users DROP COLUMN id;

-- Add new column without default
ALTER TABLE users ADD COLUMN phone VARCHAR(20) NOT NULL;
