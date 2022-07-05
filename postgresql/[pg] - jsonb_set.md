## [pg] - json function and operators

### Create Data


### jsonb operators
- does first jsonb contains the second jsonb
- jsonb @> jsonb --> boolean
```sql
'{"a":1, "b":2}'::jsonb @> '{"b":2}'::jsonb → t
```

### json creation functions
- to_json(any_element) --> json
- to_jsonb(any_element) --> jsonb

```sql
to_json('Fred said "Hi."'::text) → "Fred said \"Hi.\""

to_jsonb(row(42, 'Fred said "Hi."'::text)) → {"f1": 42, "f2": "Fred said \"Hi.\""}
```

```
jsonb_set ( target jsonb, path text[], new_value jsonb [, create_if_missing boolean ] ) → jsonb
```